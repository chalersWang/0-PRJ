`ifndef _CANFD_REF_MODEL_SV_
`define _CANFD_REF_MODEL_SV_

//=========================================================================
// canfd_ref_model: CANFD 控制器行为级参考模型
//   职责: 根据 AXI4-Lite 写入的寄存器/TX缓冲器内容，预测期望的总线行为
//         根据总线注入的帧，预测期望的 RX FIFO 内容和寄存器状态变化
//   v2.0: 修正错误计数器精度, CRC独立计算, FIFO1溢出, TX Cancel完整
//=========================================================================
class canfd_ref_model extends uvm_object;

    // ===== 内部状态镜像 =====
    logic [31:0]  SRR, MSR, BRPR, BTR, ECR, ESR, SR, ISR, IER, ICR, TSR;
    logic [31:0]  DP_BRPR, DP_BTR, TRR, TCR, TXE_FSR, TXE_WMR;
    logic [31:0]  RCS0, RCS1, RCS2, AFR, FSR, WMR;

    // TX 缓冲器模型 (最多32个)
    typedef struct {
        bit         valid;
        bit [28:0]  id;
        bit         ide;
        bit         rtr;
        bit         fdf;
        bit         brs;
        bit         esi;
        bit [3:0]   dlc;
        bit [7:0]   data[64];
        bit         ready_req;
    } tx_buf_t;
    tx_buf_t  tx_bufs[32];

    // RX FIFO 模型
    typedef struct {
        bit [28:0]  id;
        bit         ide;
        bit         rtr;
        bit         fdf;
        bit         brs;
        bit         esi;
        bit [3:0]   dlc;
        bit [7:0]   data[64];
        bit [15:0]  timestamp;
    } rx_msg_t;
    rx_msg_t  rx_fifo0[$];
    rx_msg_t  rx_fifo1[$];
    int       rx_fifo0_depth = 64;
    int       rx_fifo1_depth = 64;

    // TX 事件 FIFO
    typedef struct {
        bit [28:0]  id;
        bit [3:0]   dlc;
        bit [15:0]  timestamp;
    } tx_event_t;
    tx_event_t  tx_event_fifo[$];
    int         tx_event_depth = 32;

    // 错误计数器 (v2.0: 9-bit 支持 0-255 范围)
    bit [8:0]   TEC = 0;
    bit [8:0]   REC = 0;

    // CAN 规范错误限值
    parameter bit [8:0] EWARN_LIMIT  = 9'd96;
    parameter bit [8:0] EPAS_LIMIT   = 9'd128;
    parameter bit [8:0] BUSOFF_LIMIT = 9'd256;

    // CRC 多项式
    parameter logic [14:0] CRC15_POLY = 15'h4599;
    parameter logic [16:0] CRC17_POLY = 17'h1685B;
    parameter logic [20:0] CRC21_POLY = 21'h102899;

    // 过滤器 (FIFO模式, 32组)
    typedef struct {
        bit         enable;
        bit [28:0]  id;
        bit [28:0]  mask;
        bit         ide;
    } filter_t;
    filter_t  filters0[32];
    filter_t  filters1[32];

    // 时间戳
    bit [15:0]  tsr = 0;

    // 统计
    int  tx_count = 0;
    int  rx_count = 0;

    `uvm_object_utils(canfd_ref_model)

    function new(string name="canfd_ref_model");
        super.new(name);
        reset_state();
    endfunction

    //---------------------------------------------------------------------
    // reset_state: 复位所有内部状态
    //---------------------------------------------------------------------
    function void reset_state();
        SRR = 0; MSR = 0; BRPR = 0; BTR = 0; ECR = 0; ESR = 0;
        SR = 32'h1;  // CONFIG 位=1 (配置模式)
        ISR = 0; IER = 0; TSR = 0;
        DP_BRPR = 0; DP_BTR = 0; TRR = 0; TCR = 0;
        TXE_FSR = 0; TXE_WMR = 0;
        RCS0 = 0; RCS1 = 0; RCS2 = 0; AFR = 0; FSR = 0; WMR = 0;
        TEC = 0; REC = 0; tsr = 0;
        tx_count = 0; rx_count = 0;
        rx_fifo0.delete(); rx_fifo1.delete();
        tx_event_fifo.delete();
        foreach (tx_bufs[i]) tx_bufs[i] = '{default:0};
        foreach (filters0[i]) filters0[i] = '{default:0};
        foreach (filters1[i]) filters1[i] = '{default:0};
    endfunction

    //---------------------------------------------------------------------
    // write_reg: 处理寄存器写操作
    //---------------------------------------------------------------------
    function void write_reg(input logic [31:0] addr, input logic [31:0] data);
        case (addr)
            16'h0000: begin
                SRR = data;
                if (data[0]) begin
                    reset_state();
                    SRR = 0;
                end
            end
            16'h0004: MSR  = data;
            16'h0008: BRPR = data;
            16'h000C: BTR  = data;
            16'h0014: ESR &= ~data;  // W1C
            16'h0020: IER  = data;
            16'h0024: ISR &= ~data;  // ICR - W1C
            16'h0028: TSR  = data;
            16'h0088: DP_BRPR = data;
            16'h008C: DP_BTR  = data;
            16'h0090: begin
                TRR |= data;
                process_tx_arbitration();
            end
            16'h0098: begin  // v2.0: TX Cancel 完整清理
                TCR |= data;
                for (int i=0; i<32; i++) begin
                    if (data[i]) begin
                        tx_bufs[i].ready_req = 0;
                        tx_bufs[i].valid     = 0;
                        if (tx_event_fifo.size() > 0) begin
                            tx_event_fifo.pop_back();
                            TXE_FSR = tx_event_fifo.size();
                        end
                    end
                end
            end
            16'h00A4: TXE_WMR = data;
            16'h00B0: RCS0 = data;
            16'h00B4: RCS1 = data;
            16'h00B8: RCS2 = data;
            16'h00E0: AFR  = data;
            16'h00EC: WMR  = data;
            default: ;
        endcase
    endfunction

    //---------------------------------------------------------------------
    // read_reg: 返回期望的寄存器读值 (v2.0: 动态计算)
    //---------------------------------------------------------------------
    function logic [31:0] read_reg(input logic [31:0] addr);
        case (addr)
            16'h0000: return SRR;
            16'h0004: return MSR;
            16'h0008: return BRPR;
            16'h000C: return BTR;
            16'h0010: return {REC[7:0], TEC[7:0]};   // ECR — 动态
            16'h0014: return ESR;
            16'h0018: return compute_sr();             // SR — 动态
            16'h001C: return ISR;                      // ISR — 动态
            16'h0020: return IER;
            16'h0028: return TSR;
            16'h0088: return DP_BRPR;
            16'h008C: return DP_BTR;
            16'h0090: return TRR;
            16'h0098: return TCR;
            16'h00A0: return TXE_FSR;
            16'h00A4: return TXE_WMR;
            16'h00B0: return RCS0;
            16'h00B4: return RCS1;
            16'h00B8: return RCS2;
            16'h00E0: return AFR;
            16'h00E8: return FSR;
            16'h00EC: return WMR;
            default:  return 32'h0;
        endcase
    endfunction

    //---------------------------------------------------------------------
    // compute_sr: 动态计算状态寄存器
    //---------------------------------------------------------------------
    function logic [31:0] compute_sr();
        logic [31:0] sr_val;
        sr_val = 32'h0;
        sr_val[0] = ~SRR[1];   // CONFIG (CEN=0)
        sr_val[5] = (TEC >= BUSOFF_LIMIT);  // BOFF
        sr_val[4] = (TEC >= EPAS_LIMIT || REC >= EPAS_LIMIT);  // EPAS
        return sr_val;
    endfunction

    //---------------------------------------------------------------------
    // write_tx_buf
    //---------------------------------------------------------------------
    function void write_tx_buf(input int buf_idx, input logic [31:0] offset, input logic [31:0] data);
        if (buf_idx < 0 || buf_idx >= 32) return;
        tx_bufs[buf_idx].valid = 1;
        case (offset)
            0: begin
                tx_bufs[buf_idx].id  = data[28:0];
                tx_bufs[buf_idx].ide = data[31];
                tx_bufs[buf_idx].rtr = data[30];
                tx_bufs[buf_idx].fdf = data[29];
            end
            1: begin
                tx_bufs[buf_idx].dlc = data[3:0];
                tx_bufs[buf_idx].brs = data[4];
                tx_bufs[buf_idx].esi = data[5];
            end
            default: begin
                int byte_idx = (offset - 2) * 4;
                if (byte_idx < 64) begin
                    tx_bufs[buf_idx].data[byte_idx+0] = data[7:0];
                    tx_bufs[buf_idx].data[byte_idx+1] = data[15:8];
                    tx_bufs[buf_idx].data[byte_idx+2] = data[23:16];
                    tx_bufs[buf_idx].data[byte_idx+3] = data[31:24];
                end
            end
        endcase
    endfunction

    //---------------------------------------------------------------------
    // process_tx_arbitration
    //---------------------------------------------------------------------
    function void process_tx_arbitration();
        int  min_idx = -1;
        bit [28:0] min_id = 29'h1FFFFFFF;

        for (int i=0; i<32; i++) begin
            if (tx_bufs[i].ready_req && tx_bufs[i].valid) begin
                if (tx_bufs[i].id < min_id) begin
                    min_id = tx_bufs[i].id;
                    min_idx = i;
                end
            end
        end

        if (min_idx >= 0) begin
            tx_bufs[min_idx].ready_req = 0;
            tx_count++;

            ISR[2] = 1; // TXOK

            if (tx_event_fifo.size() < tx_event_depth) begin
                tx_event_t ev;
                ev.id = tx_bufs[min_idx].id;
                ev.dlc = tx_bufs[min_idx].dlc;
                ev.timestamp = tsr;
                tx_event_fifo.push_back(ev);
                TXE_FSR = tx_event_fifo.size();
            end

            if (TEC > 0) TEC--;
        end
    endfunction

    //---------------------------------------------------------------------
    // on_can_frame_received: 总线帧接收处理 (v2.0: FIFO1 溢出检测)
    //---------------------------------------------------------------------
    function void on_can_frame_received(input canphy_trans tr);
        bit matched0, matched1;

        if (tr.frame_type == ERROR_FRAME || tr.frame_type == OVERLOAD_FRAME) return;

        matched0 = check_filter(tr, filters0);
        matched1 = check_filter(tr, filters1);

        // FIFO0
        if (matched0 && rx_fifo0.size() < rx_fifo0_depth) begin
            rx_msg_t msg;
            msg.id = tr.can_id; msg.ide = tr.ide; msg.rtr = tr.rtr;
            msg.fdf = tr.fdf; msg.brs = tr.brs; msg.esi = tr.esi;
            msg.dlc = tr.dlc; msg.timestamp = tsr;
            foreach (tr.data[i]) msg.data[i] = tr.data[i];
            rx_fifo0.push_back(msg);
            rx_count++;
            ISR[3] = 1; // RXOK
            update_fifo_status();
        end else if (matched0 && rx_fifo0.size() >= rx_fifo0_depth) begin
            ISR[4] = 1; // RXOVF
        end

        // FIFO1 (v2.0: 增加溢出检测)
        if (matched1 && rx_fifo1.size() < rx_fifo1_depth) begin
            rx_msg_t msg;
            msg.id = tr.can_id; msg.ide = tr.ide; msg.rtr = tr.rtr;
            msg.fdf = tr.fdf; msg.brs = tr.brs; msg.esi = tr.esi;
            msg.dlc = tr.dlc; msg.timestamp = tsr;
            foreach (tr.data[i]) msg.data[i] = tr.data[i];
            rx_fifo1.push_back(msg);
            update_fifo_status();
        end else if (matched1 && rx_fifo1.size() >= rx_fifo1_depth) begin
            ISR[4] = 1; // RXOVF (shared bit)
        end
    endfunction

    //---------------------------------------------------------------------
    // check_filter
    //---------------------------------------------------------------------
    function bit check_filter(input canphy_trans tr, input filter_t filters[32]);
        bit any_enable = 0;
        for (int i=0; i<32; i++) if (filters[i].enable) any_enable = 1;
        if (!any_enable) return 1;

        for (int i=0; i<32; i++) begin
            if (!filters[i].enable) continue;
            if (filters[i].ide != tr.ide) continue;
            if ((tr.can_id & filters[i].mask) == (filters[i].id & filters[i].mask))
                return 1;
        end
        return 0;
    endfunction

    //---------------------------------------------------------------------
    // update_fifo_status
    //---------------------------------------------------------------------
    function void update_fifo_status();
        bit [5:0] depth0, depth1;
        depth0 = rx_fifo0.size();
        depth1 = rx_fifo1.size();
        FSR = {depth1, depth0};
    endfunction

    //---------------------------------------------------------------------
    // on_error_detected: 错误检测处理 (v2.0: CAN 规范错误计数值)
    //  - Bit Error:       TEC/REC += 8
    //  - Stuff Error:     TEC/REC += 8
    //  - CRC Error:       TEC/REC += 8
    //  - Form Error:      TEC/REC += 8
    //  - ACK Error:       TEC += 8 (发送方)
    //  - 成功发送:        TEC -= 1 (下限0)
    //  - 成功接收:        REC -= 1 (下限0，若 REC<128 且检测到连续128次11隐性位)
    //---------------------------------------------------------------------
    function void on_error_detected(input can_error_type_e err_type, input bit is_fd,
                                    input bit is_tx);
        bit [8:0] inc;
        inc = 8;

        case (err_type)
            ERR_BIT: begin
                if (is_fd) ESR[11] = 1; else ESR[4] = 1;
            end
            ERR_STUFF: begin
                if (is_fd) ESR[10] = 1; else ESR[8] = 1;
            end
            ERR_CRC: begin
                ESR[6] = 1;
            end
            ERR_FORM: begin
                if (is_fd) ESR[9] = 1; else ESR[7] = 1;
            end
            ERR_ACK: begin
                ESR[5] = 1;
            end
        endcase

        if (is_tx) begin
            TEC += inc;
        end else begin
            REC += inc;
        end

        // 错误状态转换
        if (TEC >= EWARN_LIMIT || REC >= EWARN_LIMIT)
            ISR[0] = 1; // EWARN
        if (TEC >= EPAS_LIMIT || REC >= EPAS_LIMIT)
            SR[4] = 1; // EPAS
        if (TEC >= BUSOFF_LIMIT) begin
            SR[5] = 1; // BOFF
            SR[0] = 0;
        end

        // 饱和
        if (TEC > BUSOFF_LIMIT) TEC = BUSOFF_LIMIT;
        if (REC > EPAS_LIMIT)   REC = EPAS_LIMIT;
    endfunction

    //---------------------------------------------------------------------
    // calc_frame_crc: 独立 CRC 计算 (v2.0)
    //---------------------------------------------------------------------
    function bit [20:0] calc_frame_crc(bit bit_stream[], bit is_fd, int data_len);
        bit [20:0] crc;
        int crc_width;

        if (!is_fd) begin
            crc_width = 15;
            crc = 15'h0;
        end else if (data_len <= 16) begin
            crc_width = 17;
            crc = 17'h0;
        end else begin
            crc_width = 21;
            crc = 21'h0;
        end

        foreach (bit_stream[i]) begin
            bit feed = bit_stream[i] ^ crc[crc_width-1];
            crc = (crc << 1) & ((1<<crc_width)-1);
            if (feed) begin
                case (crc_width)
                    15: crc ^= CRC15_POLY;
                    17: crc ^= CRC17_POLY;
                    21: crc ^= CRC21_POLY;
                endcase
            end
        end

        return crc;
    endfunction

    //---------------------------------------------------------------------
    // tick: 每个时钟周期调用
    //---------------------------------------------------------------------
    function void tick();
        tsr++;
        if (tsr == 0) ISR[7] = 1;
    endfunction

    //---------------------------------------------------------------------
    // get_expected_tx_frame
    //---------------------------------------------------------------------
    function canphy_trans get_expected_tx_frame();
        canphy_trans tr;
        int min_idx = -1;
        bit [28:0] min_id = 29'h1FFFFFFF;

        for (int i=0; i<32; i++) begin
            if (tx_bufs[i].ready_req && tx_bufs[i].valid) begin
                if (tx_bufs[i].id < min_id) begin
                    min_id = tx_bufs[i].id;
                    min_idx = i;
                end
            end
        end

        if (min_idx < 0) return null;

        tr = canphy_trans::type_id::create("exp_tx");
        tr.can_id = tx_bufs[min_idx].id;
        tr.ide    = tx_bufs[min_idx].ide;
        tr.rtr    = tx_bufs[min_idx].rtr;
        tr.fdf    = tx_bufs[min_idx].fdf;
        tr.brs    = tx_bufs[min_idx].brs;
        tr.esi    = tx_bufs[min_idx].esi;
        tr.dlc    = tx_bufs[min_idx].dlc;

        if (tr.fdf)
            tr.frame_type = tr.ide ? CANFD_EXT : CANFD_STD;
        else if (tr.rtr)
            tr.frame_type = tr.ide ? CAN_EXT_REMOTE : CAN_STD_REMOTE;
        else
            tr.frame_type = tr.ide ? CAN_EXT_DATA : CAN_STD_DATA;

        int n_bytes = tr.dlc_to_bytes(tr.dlc);
        if (n_bytes > 0 && !tr.rtr) begin
            tr.data = new[n_bytes];
            for (int i=0; i<n_bytes; i++)
                tr.data[i] = tx_bufs[min_idx].data[i];
        end

        return tr;
    endfunction

    //---------------------------------------------------------------------
    // read_rx_fifo
    //---------------------------------------------------------------------
    function rx_msg_t read_rx_fifo(input int fifo_id);
        rx_msg_t msg;
        if (fifo_id == 0 && rx_fifo0.size() > 0) begin
            msg = rx_fifo0.pop_front();
            update_fifo_status();
        end else if (fifo_id == 1 && rx_fifo1.size() > 0) begin
            msg = rx_fifo1.pop_front();
            update_fifo_status();
        end
        return msg;
    endfunction

endclass

`endif
