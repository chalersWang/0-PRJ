`ifndef _MPSOC_REG_SEQUENCE_SV_
`define _%s_REG_SEQUENCE_SV_

//=========================================================================
// mpsoc_reg_sequence: 寄存器自测试 Sequence 库
//   包含:
//   - mpsoc_reg_access_seq: 复位值检查 + 读写比对
//   - mpsoc_reg_bit_bash_seq: 位翻转 (walking-1/walking-0)
//   - mpsoc_reg_stress_seq: 随机读写压力测试
//=========================================================================

//=========================================================================
// mpsoc_reg_access_seq: 访问测试
//   Step 1: 读取所有寄存器的复位值，与期望值比对
//   Step 2: 对每个 RW 寄存器执行 写→读→比对
//=========================================================================
class mpsoc_reg_access_seq extends uvm_sequence;

    mpsoc_reg_block  regmodel;
    uvm_status_e  status;
    uvm_reg_data_t value;

    `uvm_object_utils(mpsoc_reg_access_seq)
    function new(string name="mpsoc_reg_access_seq");
        super.new(name);
    endfunction

    virtual task body();
        uvm_reg regs[$];
        uvm_reg_data_t rdata;
        int pass_cnt, fail_cnt;

        `uvm_info(get_type_name(), "===== Register Access Test Start =====", UVM_LOW)

        // 获取 reg_block（从 config_db 或 sequence 内置）
        if (regmodel == null) begin
            `uvm_fatal(get_type_name(), "regmodel is null! Must be set before starting.")
        end

        // 获取所有寄存器
        regmodel.get_registers(regs);
        pass_cnt = 0;
        fail_cnt = 0;

        `uvm_info(get_type_name(), $sformatf("Total registers: %%0d", regs.size()), UVM_LOW)

        foreach (regs[i]) begin
            string rname = regs[i].get_full_name();

            `uvm_info(get_type_name(), $sformatf("Testing register: %%s", rname), UVM_MEDIUM)

            // ---------- Step 1: Read reset value ----------
            regs[i].read(status, rdata, UVM_FRONTDOOR);
            if (status != UVM_IS_OK) begin
                `uvm_error(get_type_name(), $sformatf("Read failed: %%s", rname))
            end
            else begin
                uvm_reg_data_t exp_val = regs[i].get_reset();
                bit mismatch = 0;
                // 检查每个 field 的复位值
                uvm_reg_field fields[$];
                regs[i].get_fields(fields);
                foreach (fields[j]) begin
                    uvm_reg_data_t fval = (rdata >> fields[j].get_lsb_pos()) & ((1 << fields[j].get_n_bits()) - 1);
                    uvm_reg_data_t fexp = fields[j].get_reset();
                    if (fval !== fexp) begin
                        `uvm_error(get_type_name(), $sformatf(
                            "Reset mismatch: %%s.%%s: exp=%%0h, got=%%0h",
                            rname, fields[j].get_name(), fexp, fval))
                        mismatch = 1;
                    end
                end
                if (!mismatch) begin
                    `uvm_info(get_type_name(), $sformatf("  PASS: %%s reset check", rname), UVM_HIGH)
                    pass_cnt++;
                end
                else begin
                    fail_cnt++;
                end
            end

            // ---------- Step 2: Write → Read back (RW fields only) ----------
            if (regs[i].has_access(UVM_REG_ACCESS_RW)) begin
                uvm_reg_data_t wdata = {$urandom()} & ((1 << regs[i].get_n_bits()) - 1);
                regs[i].write(status, wdata, UVM_FRONTDOOR);
                if (status == UVM_IS_OK) begin
                    regs[i].read(status, rdata, UVM_FRONTDOOR);
                    if (rdata !== wdata) begin
                        `uvm_error(get_type_name(), $sformatf(
                            "Readback mismatch: %%s: wrote %%0h, read %%0h",
                            rname, wdata, rdata))
                        fail_cnt++;
                    end
                    else begin
                        `uvm_info(get_type_name(), $sformatf("  PASS: %%s R/W test", rname), UVM_HIGH)
                        pass_cnt++;
                    end
                end
                // 写回复位值
                regs[i].write(status, regs[i].get_reset(), UVM_FRONTDOOR);
            end
        end

        `uvm_info(get_type_name(), $sformatf("===== Reg Access Test Done: %%0d pass, %%0d fail =====", pass_cnt, fail_cnt), UVM_LOW)
    endtask : body

endclass : mpsoc_reg_access_seq

//=========================================================================
// mpsoc_reg_bit_bash_seq: 位翻转测试
//   对每个 RW 寄存器执行:
//   - Walking-1: 依次将每一位设为 1，其余为 0，写入后读回比对
//   - Walking-0: 依次将每一位设为 0，其余为 1，写入后读回比对
//=========================================================================
class mpsoc_reg_bit_bash_seq extends uvm_sequence;

    mpsoc_reg_block  regmodel;
    uvm_status_e  status;

    `uvm_object_utils(mpsoc_reg_bit_bash_seq)
    function new(string name="mpsoc_reg_bit_bash_seq");
        super.new(name);
    endfunction

    virtual task body();
        uvm_reg regs[$];
        uvm_reg_data_t rdata, wdata, bitmask;
        int pass_cnt, fail_cnt;
        int n_bits;

        `uvm_info(get_type_name(), "===== Register Bit Bash Test Start =====", UVM_LOW)

        if (regmodel == null)
            `uvm_fatal(get_type_name(), "regmodel is null!")

        regmodel.get_registers(regs);
        pass_cnt = 0; fail_cnt = 0;

        foreach (regs[i]) begin
            if (!regs[i].has_access(UVM_REG_ACCESS_RW))
                continue;

            n_bits = regs[i].get_n_bits();
            string rname = regs[i].get_full_name();

            // ----- Walking-1 -----
            for (int b = 0; b < n_bits; b++) begin
                bitmask = 1 << b;
                regs[i].write(status, bitmask, UVM_FRONTDOOR);
                if (status == UVM_IS_OK) begin
                    regs[i].read(status, rdata, UVM_FRONTDOOR);
                    if (rdata !== bitmask) begin
                        `uvm_error(get_type_name(), $sformatf(
                            "Walking-1 FAIL: %%s bit%%0d: exp=%%0h, got=%%0h",
                            rname, b, bitmask, rdata))
                        fail_cnt++;
                    end
                    else begin
                        pass_cnt++;
                    end
                end
            end

            // ----- Walking-0 -----
            for (int b = 0; b < n_bits; b++) begin
                bitmask = ~(1 << b) & ((1 << n_bits) - 1);
                regs[i].write(status, bitmask, UVM_FRONTDOOR);
                if (status == UVM_IS_OK) begin
                    regs[i].read(status, rdata, UVM_FRONTDOOR);
                    if (rdata !== bitmask) begin
                        `uvm_error(get_type_name(), $sformatf(
                            "Walking-0 FAIL: %%s bit%%0d: exp=%%0h, got=%%0h",
                            rname, b, bitmask, rdata))
                        fail_cnt++;
                    end
                    else begin
                        pass_cnt++;
                    end
                end
            end

            // 恢复复位值
            regs[i].write(status, regs[i].get_reset(), UVM_FRONTDOOR);
            `uvm_info(get_type_name(), $sformatf("  Done: %%s (%%0d bits)", rname, n_bits), UVM_MEDIUM)
        end

        `uvm_info(get_type_name(), $sformatf("===== Bit Bash Done: %%0d pass, %%0d fail =====", pass_cnt, fail_cnt), UVM_LOW)
    endtask : body

endclass : mpsoc_reg_bit_bash_seq

//=========================================================================
// mpsoc_reg_stress_seq: 随机读写压力测试
//   对每个 RW 寄存器执行 N 次随机写入+读回比对
//   默认 N=100，可通过 reg_stress_count 配置
//=========================================================================
class mpsoc_reg_stress_seq extends uvm_sequence;

    mpsoc_reg_block  regmodel;
    uvm_status_e  status;
    int           reg_stress_count = 100;  // 每寄存器随机读写次数

    `uvm_object_utils(mpsoc_reg_stress_seq)
    function new(string name="mpsoc_reg_stress_seq");
        super.new(name);
    endfunction

    virtual task body();
        uvm_reg regs[$];
        uvm_reg_data_t rdata, wdata;
        int pass_cnt, fail_cnt;

        `uvm_info(get_type_name(), "===== Register Stress Test Start =====", UVM_LOW)

        if (regmodel == null)
            `uvm_fatal(get_type_name(), "regmodel is null!")

        regmodel.get_registers(regs);
        pass_cnt = 0; fail_cnt = 0;

        repeat (reg_stress_count) begin
            foreach (regs[i]) begin
                if (!regs[i].has_access(UVM_REG_ACCESS_RW))
                    continue;

                // 随机写入
                wdata = {$urandom()} & ((1 << regs[i].get_n_bits()) - 1);
                regs[i].write(status, wdata, UVM_FRONTDOOR);
                if (status != UVM_IS_OK) begin
                    fail_cnt++;
                    continue;
                end

                // 读回比对
                regs[i].read(status, rdata, UVM_FRONTDOOR);
                if (rdata !== wdata) begin
                    `uvm_error(get_type_name(), $sformatf(
                        "Stress FAIL: %%s: wrote %%0h, read %%0h",
                        regs[i].get_full_name(), wdata, rdata))
                    fail_cnt++;
                end
                else begin
                    pass_cnt++;
                end
            end
        end

        `uvm_info(get_type_name(), $sformatf("===== Stress Done: %%0d pass, %%0d fail =====", pass_cnt, fail_cnt), UVM_LOW)
    endtask : body

endclass : mpsoc_reg_stress_seq

`endif
