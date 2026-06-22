`ifndef _CANFD_SCOREBOARD_SV_
`define _CANFD_SCOREBOARD_SV_

`include "canfd_function_coverage.sv"

//=========================================================================
// canfd_scoreboard: 完整的 CANFD 验证计分板
//   双 FIFO 并行处理 + Reference Model 比对 + 统计报告
//   v2.0: 区分 TX/RX 方向 — TX 比对期望帧, RX 更新参考模型状态
//=========================================================================
class canfd_scoreboard extends uvm_scoreboard;

    canfd_config     canfd_cfg;
    canfd_ref_model  ref_model;

    // TLM FIFO (方向感知)
    uvm_analysis_fifo #(canphy_trans)    canphy_analysis_fifo;
    uvm_analysis_fifo #(canphy_trans)    canphy_tx_analysis_fifo;
    uvm_analysis_fifo #(canphy_trans)    canphy_rx_analysis_fifo;
    uvm_analysis_fifo #(axi4lite_trans)  axi4lite_analysis_fifo;

    // 功能覆盖率实例
    `ifdef COVERAGE_CANPHY
    FeatureListNum_CANPHY  canphy_cov;
    `endif
    `ifdef COVERAGE_AXI4LITE
    FeatureListNum_AXI4LITE  axi4lite_cov;
    `endif

    // 统计
    int  canphy_tx_count = 0;
    int  canphy_rx_count = 0;
    int  axi4lite_wr_count = 0;
    int  axi4lite_rd_count = 0;
    int  pass_count = 0;
    int  fail_count = 0;
    int  mismatch_count = 0;

    `uvm_component_utils(canfd_scoreboard)

    function new(string name="canfd_scoreboard", uvm_component parent=null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        canphy_analysis_fifo    = new("canphy_analysis_fifo", this);
        canphy_tx_analysis_fifo = new("canphy_tx_analysis_fifo", this);
        canphy_rx_analysis_fifo = new("canphy_rx_analysis_fifo", this);
        axi4lite_analysis_fifo  = new("axi4lite_analysis_fifo", this);
        ref_model = canfd_ref_model::type_id::create("ref_model", this);

        `ifdef COVERAGE_CANPHY
        canphy_cov = new();
        `endif
        `ifdef COVERAGE_AXI4LITE
        axi4lite_cov = new();
        `endif
    endfunction

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);
        @(posedge canfd_vif.rstn);
        if (!uvm_config_db#(canfd_config)::get(this, "", "canfd_config", canfd_cfg))
            `uvm_error(get_type_name(), "failed to get config")

        fork
            // CAN PHY TX 帧处理线程 (DUT 发送)
            forever begin
                canphy_trans tr;
                canphy_tx_analysis_fifo.get(tr);
                process_tx_frame(tr);
            end
            // CAN PHY RX 帧处理线程 (外部注入)
            forever begin
                canphy_trans tr;
                canphy_rx_analysis_fifo.get(tr);
                process_rx_frame(tr);
            end
            // AXI4-Lite 事务处理线程
            forever begin
                axi4lite_trans tr;
                axi4lite_analysis_fifo.get(tr);
                process_axi4lite_tr(tr);
            end
            // 时间戳滴答线程
            forever begin
                @(posedge canfd_vif.clk);
                ref_model.tick();
            end
        join
    endtask

    //---------------------------------------------------------------------
    // process_tx_frame: 处理 DUT TX 帧 — 与 ref_model 期望比对
    //---------------------------------------------------------------------
    virtual function void process_tx_frame(canphy_trans tr);
        `uvm_info(get_type_name(), $sformatf("SCB TX: %s", tr.convert2string()), UVM_HIGH)

        `ifdef COVERAGE_CANPHY
        canphy_cov.sample(tr);
        `endif

        if (tr.frame_type == ERROR_FRAME) begin
            `uvm_info(get_type_name(), "Detected ERROR FRAME on TX bus", UVM_MEDIUM)
            return;
        end

        canphy_trans  exp_tr;
        exp_tr = ref_model.get_expected_tx_frame();
        if (exp_tr != null) begin
            compare_tx_frame(exp_tr, tr);
            ref_model.process_tx_arbitration();
            canphy_tx_count++;
        end else begin
            `uvm_warning(get_type_name(), "DUT TX frame but no expected TX from ref_model")
        end
    endfunction

    //---------------------------------------------------------------------
    // process_rx_frame: 处理外部注入帧 — 更新参考模型接收状态
    //---------------------------------------------------------------------
    virtual function void process_rx_frame(canphy_trans tr);
        `uvm_info(get_type_name(), $sformatf("SCB RX: %s", tr.convert2string()), UVM_HIGH)

        `ifdef COVERAGE_CANPHY
        canphy_cov.sample(tr);
        `endif

        if (tr.frame_type == ERROR_FRAME || tr.frame_type == OVERLOAD_FRAME) begin
            `uvm_info(get_type_name(), "RX error/overload frame — skipping", UVM_MEDIUM)
            return;
        end

        ref_model.on_can_frame_received(tr);
        canphy_rx_count++;
    endfunction

    //---------------------------------------------------------------------
    // compare_tx_frame: 比对期望 TX 帧与实际 TX 帧
    //---------------------------------------------------------------------
    virtual function void compare_tx_frame(canphy_trans exp, canphy_trans act);
        bit match = 1;

        if (exp.frame_type != act.frame_type) begin
            `uvm_error(get_type_name(), $sformatf(
                "TX frame_type mismatch: exp=%s act=%s", exp.frame_type.name(), act.frame_type.name()))
            match = 0;
        end
        if (exp.can_id !== act.can_id) begin
            `uvm_error(get_type_name(), $sformatf(
                "TX ID mismatch: exp=0x%07h act=0x%07h", exp.can_id, act.can_id))
            match = 0;
        end
        if (exp.dlc !== act.dlc) begin
            `uvm_error(get_type_name(), $sformatf(
                "TX DLC mismatch: exp=%0d act=%0d", exp.dlc, act.dlc))
            match = 0;
        end
        if (exp.fdf !== act.fdf) begin
            `uvm_error(get_type_name(), $sformatf(
                "TX FDF mismatch: exp=%b act=%b", exp.fdf, act.fdf))
            match = 0;
        end
        if (exp.brs !== act.brs) begin
            `uvm_error(get_type_name(), $sformatf(
                "TX BRS mismatch: exp=%b act=%b", exp.brs, act.brs))
            match = 0;
        end

        if (!exp.rtr && exp.data.size() > 0) begin
            if (exp.data.size() != act.data.size()) begin
                `uvm_error(get_type_name(), $sformatf(
                    "TX data size mismatch: exp=%0d act=%0d", exp.data.size(), act.data.size()))
                match = 0;
            end else begin
                foreach (exp.data[i]) begin
                    if (exp.data[i] !== act.data[i]) begin
                        `uvm_error(get_type_name(), $sformatf(
                            "TX data[%0d] mismatch: exp=0x%02h act=0x%02h", i, exp.data[i], act.data[i]))
                        match = 0;
                    end
                end
            end
        end

        if (match) begin
            pass_count++;
            `uvm_info(get_type_name(), "TX frame match ✓", UVM_HIGH)
        end else begin
            fail_count++;
            mismatch_count++;
        end
    endfunction

    //---------------------------------------------------------------------
    // process_axi4lite_tr: AXI4-Lite 事务处理
    //   写操作: 更新 ref_model 状态
    //   读操作: 比对读回值与 ref_model 期望值
    //   v2.0: 移除硬编码地址跳过 — 所有寄存器都通过 ref_model 建模比对
    //---------------------------------------------------------------------
    virtual function void process_axi4lite_tr(axi4lite_trans tr);
        `uvm_info(get_type_name(), $sformatf("SCB AXI4LITE: %s", tr.convert2string()), UVM_HIGH)

        `ifdef COVERAGE_AXI4LITE
        axi4lite_cov.sample(tr);
        `endif

        if (tr.dir == AXI4LITE_WRITE) begin
            axi4lite_wr_count++;
            ref_model.write_reg(tr.addr, tr.data);

            if (tr.addr >= 16'h0100 && tr.addr <= 16'h1FFF) begin
                int buf_idx = (tr.addr - 16'h0100) / 16;
                int offset  = (tr.addr - 16'h0100) % 16;
                ref_model.write_tx_buf(buf_idx, offset, tr.data);
            end
        end else begin
            axi4lite_rd_count++;
            logic [31:0] exp_data;
            exp_data = ref_model.read_reg(tr.addr);
            if (tr.addr <= 16'h00FF) begin
                // v2.0: 所有寄存器值都由 ref_model 建模,
                // 不再跳过 ECR/SR/ISR — 任何差异都是真实的 mismatch
                if (tr.data !== exp_data) begin
                    `uvm_error(get_type_name(), $sformatf(
                        "Reg read mismatch @0x%04h: exp=0x%08h got=0x%08h",
                        tr.addr, exp_data, tr.data))
                    fail_count++;
                end else begin
                    pass_count++;
                end
            end
        end

        // 响应码检查
        if (tr.addr >= 16'h8000 && tr.resp != AXI_RESP_DECERR) begin
            `uvm_error(get_type_name(), $sformatf(
                "Expected DECERR for addr=0x%08h, got resp=%0d", tr.addr, tr.resp))
            fail_count++;
        end
        if (tr.addr < 16'h8000 && tr.resp != AXI_RESP_OKAY) begin
            `uvm_error(get_type_name(), $sformatf(
                "Unexpected error resp=%0d for addr=0x%08h", tr.resp, tr.addr))
            fail_count++;
        end
    endfunction

    virtual function void report_phase(uvm_phase phase);
        super.report_phase(phase);
        `uvm_info(get_type_name(),
            $sformatf("\n========================================\n  SCOREBOARD REPORT\n========================================\n  CANPHY TX frames:    %0d\n  CANPHY RX frames:    %0d\n  AXI4LITE writes:     %0d\n  AXI4LITE reads:      %0d\n  PASS:                %0d\n  FAIL:                %0d\n  Mismatches:          %0d\n========================================",
                canphy_tx_count, canphy_rx_count,
                axi4lite_wr_count, axi4lite_rd_count,
                pass_count, fail_count, mismatch_count), UVM_LOW)
    endfunction

endclass : canfd_scoreboard

`endif
