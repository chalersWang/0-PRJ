`ifndef _MPSOC_DEMO_TEST_SV_
`define _MPSOC_DEMO_TEST_SV_

class mpsoc_demo_sysctrl_sequence extends sysctrl_base_sequence;

    integer status;

    `uvm_object_utils(mpsoc_demo_sysctrl_sequence)

	function new(string name="mpsoc_demo_sysctrl_sequence");
		super.new(name);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	virtual task body();
		`uvm_info(get_full_name(),"body() begin ...",UVM_LOW)
		     `uvm_create(req)
		     //status=req.randomize();
		     status=req.randomize with{};
		     if(!status)`uvm_fatal(get_full_name,"Can't randomize a trans!!!")
		     `uvm_send(req)
		     //req.print();
		     //get_response(rsp);
		`uvm_info(get_full_name(),"body end ...",UVM_LOW)
	endtask

endclass

class mpsoc_demo_jtag_sequence extends jtag_base_sequence;

    integer status;

    `uvm_object_utils(mpsoc_demo_jtag_sequence)

	function new(string name="mpsoc_demo_jtag_sequence");
		super.new(name);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	virtual task body();
		`uvm_info(get_full_name(),"body() begin ...",UVM_LOW)
		     `uvm_create(req)
		     //status=req.randomize();
		     status=req.randomize with{};
		     if(!status)`uvm_fatal(get_full_name,"Can't randomize a trans!!!")
		     `uvm_send(req)
		     //req.print();
		     //get_response(rsp);
		`uvm_info(get_full_name(),"body end ...",UVM_LOW)
	endtask

endclass

class mpsoc_demo_uart_sequence extends uart_base_sequence;

    integer status;

    `uvm_object_utils(mpsoc_demo_uart_sequence)

	function new(string name="mpsoc_demo_uart_sequence");
		super.new(name);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	virtual task body();
		`uvm_info(get_full_name(),"body() begin ...",UVM_LOW)
		     `uvm_create(req)
		     //status=req.randomize();
		     status=req.randomize with{};
		     if(!status)`uvm_fatal(get_full_name,"Can't randomize a trans!!!")
		     `uvm_send(req)
		     //req.print();
		     //get_response(rsp);
		`uvm_info(get_full_name(),"body end ...",UVM_LOW)
	endtask

endclass

class mpsoc_demo_gpio_sequence extends gpio_base_sequence;

    integer status;

    `uvm_object_utils(mpsoc_demo_gpio_sequence)

	function new(string name="mpsoc_demo_gpio_sequence");
		super.new(name);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	virtual task body();
		`uvm_info(get_full_name(),"body() begin ...",UVM_LOW)
		     `uvm_create(req)
		     //status=req.randomize();
		     status=req.randomize with{};
		     if(!status)`uvm_fatal(get_full_name,"Can't randomize a trans!!!")
		     `uvm_send(req)
		     //req.print();
		     //get_response(rsp);
		`uvm_info(get_full_name(),"body end ...",UVM_LOW)
	endtask

endclass

class mpsoc_demo_qspi_sequence extends qspi_base_sequence;

    integer status;

    `uvm_object_utils(mpsoc_demo_qspi_sequence)

	function new(string name="mpsoc_demo_qspi_sequence");
		super.new(name);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	virtual task body();
		`uvm_info(get_full_name(),"body() begin ...",UVM_LOW)
		     `uvm_create(req)
		     //status=req.randomize();
		     status=req.randomize with{};
		     if(!status)`uvm_fatal(get_full_name,"Can't randomize a trans!!!")
		     `uvm_send(req)
		     //req.print();
		     //get_response(rsp);
		`uvm_info(get_full_name(),"body end ...",UVM_LOW)
	endtask

endclass

class mpsoc_demo_switch_sequence extends switch_base_sequence;

    integer status;

    `uvm_object_utils(mpsoc_demo_switch_sequence)

	function new(string name="mpsoc_demo_switch_sequence");
		super.new(name);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	virtual task body();
		`uvm_info(get_full_name(),"body() begin ...",UVM_LOW)
		     `uvm_create(req)
		     //status=req.randomize();
		     status=req.randomize with{};
		     if(!status)`uvm_fatal(get_full_name,"Can't randomize a trans!!!")
		     `uvm_send(req)
		     //req.print();
		     //get_response(rsp);
		`uvm_info(get_full_name(),"body end ...",UVM_LOW)
	endtask

endclass

class mpsoc_demo_miiphy_sequence extends miiphy_base_sequence;

    integer status;

    `uvm_object_utils(mpsoc_demo_miiphy_sequence)

	function new(string name="mpsoc_demo_miiphy_sequence");
		super.new(name);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	virtual task body();
		`uvm_info(get_full_name(),"body() begin ...",UVM_LOW)
		     `uvm_create(req)
		     //status=req.randomize();
		     status=req.randomize with{};
		     if(!status)`uvm_fatal(get_full_name,"Can't randomize a trans!!!")
		     `uvm_send(req)
		     //req.print();
		     //get_response(rsp);
		`uvm_info(get_full_name(),"body end ...",UVM_LOW)
	endtask

endclass

class mpsoc_demo_efuse_sequence extends efuse_base_sequence;

    integer status;

    `uvm_object_utils(mpsoc_demo_efuse_sequence)

	function new(string name="mpsoc_demo_efuse_sequence");
		super.new(name);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	virtual task body();
		`uvm_info(get_full_name(),"body() begin ...",UVM_LOW)
		     `uvm_create(req)
		     //status=req.randomize();
		     status=req.randomize with{};
		     if(!status)`uvm_fatal(get_full_name,"Can't randomize a trans!!!")
		     `uvm_send(req)
		     //req.print();
		     //get_response(rsp);
		`uvm_info(get_full_name(),"body end ...",UVM_LOW)
	endtask

endclass


class mpsoc_demo_i2c_sequence extends i2c_base_sequence;

    integer status;

    `uvm_object_utils(mpsoc_demo_i2c_sequence)

	function new(string name="mpsoc_demo_i2c_sequence");
		super.new(name);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	virtual task body();
		`uvm_info(get_full_name(),"body() begin ...",UVM_LOW)
		     `uvm_create(req)
		     //status=req.randomize();
		     status=req.randomize with{ addr == 7'h50; rnw == 1'b0; data.size() == 4; };
		     if(!status)`uvm_fatal(get_full_name,"Can't randomize a trans!!!")
		     `uvm_send(req)
		     //req.print();
		     //get_response(rsp);
		`uvm_info(get_full_name(),"body end ...",UVM_LOW)
	endtask

endclass

class mpsoc_demo_spi_sequence extends spi_base_sequence;

    integer status;

    `uvm_object_utils(mpsoc_demo_spi_sequence)

	function new(string name="mpsoc_demo_spi_sequence");
		super.new(name);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	virtual task body();
		`uvm_info(get_full_name(),"body() begin ...",UVM_LOW)
		     `uvm_create(req)
		     //status=req.randomize();
		     status=req.randomize with{ channel == 0; frame_size == 8; tx_data == 32'h5A; };
		     if(!status)`uvm_fatal(get_full_name,"Can't randomize a trans!!!")
		     `uvm_send(req)
		     //req.print();
		     //get_response(rsp);
		`uvm_info(get_full_name(),"body end ...",UVM_LOW)
	endtask

endclass

class mpsoc_demo_wdt_sequence extends wdt_base_sequence;

    integer status;

    `uvm_object_utils(mpsoc_demo_wdt_sequence)

	function new(string name="mpsoc_demo_wdt_sequence");
		super.new(name);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	virtual task body();
		`uvm_info(get_full_name(),"body() begin ...",UVM_LOW)
		     `uvm_create(req)
		     //status=req.randomize();
		     status=req.randomize with{ timeout_cycles == 100; };
		     if(!status)`uvm_fatal(get_full_name,"Can't randomize a trans!!!")
		     `uvm_send(req)
		     //req.print();
		     //get_response(rsp);
		`uvm_info(get_full_name(),"body end ...",UVM_LOW)
	endtask

endclass

class mpsoc_demo_tim_sequence extends tim_base_sequence;

    integer status;

    `uvm_object_utils(mpsoc_demo_tim_sequence)

	function new(string name="mpsoc_demo_tim_sequence");
		super.new(name);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	virtual task body();
		`uvm_info(get_full_name(),"body() begin ...",UVM_LOW)
		     `uvm_create(req)
		     //status=req.randomize();
		     status=req.randomize with{ channel == 0; pulse_count == 4; pulse_period == 10; };
		     if(!status)`uvm_fatal(get_full_name,"Can't randomize a trans!!!")
		     `uvm_send(req)
		     //req.print();
		     //get_response(rsp);
		`uvm_info(get_full_name(),"body end ...",UVM_LOW)
	endtask

endclass

class mpsoc_demo_dma_sequence extends dma_base_sequence;

    integer status;

    `uvm_object_utils(mpsoc_demo_dma_sequence)

	function new(string name="mpsoc_demo_dma_sequence");
		super.new(name);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	virtual task body();
		`uvm_info(get_full_name(),"body() begin ...",UVM_LOW)
		     `uvm_create(req)
		     //status=req.randomize();
		     status=req.randomize with{ channel == 0; handshake_delay == 64; };
		     if(!status)`uvm_fatal(get_full_name,"Can't randomize a trans!!!")
		     `uvm_send(req)
		     //req.print();
		     //get_response(rsp);
		`uvm_info(get_full_name(),"body end ...",UVM_LOW)
	endtask

endclass

class mpsoc_demo_sdram_sequence extends sdram_base_sequence;

    integer status;

    `uvm_object_utils(mpsoc_demo_sdram_sequence)

	function new(string name="mpsoc_demo_sdram_sequence");
		super.new(name);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	virtual task body();
		`uvm_info(get_full_name(),"body() begin ...",UVM_LOW)
		     `uvm_create(req)
		     //status=req.randomize();
		     status=req.randomize with{ cmd == 4'b0101; bank == 2'b00; addr == 13'h100; };
		     if(!status)`uvm_fatal(get_full_name,"Can't randomize a trans!!!")
		     `uvm_send(req)
		     //req.print();
		     //get_response(rsp);
		`uvm_info(get_full_name(),"body end ...",UVM_LOW)
	endtask

endclass


class mpsoc_demo_sequence extends mpsoc_virtual_seq_lib;

    mpsoc_demo_sysctrl_sequence     mpsoc_demo_sysctrl_seq;
    mpsoc_demo_jtag_sequence     mpsoc_demo_jtag_seq;
    mpsoc_demo_uart_sequence     mpsoc_demo_uart_seq;
    mpsoc_demo_gpio_sequence     mpsoc_demo_gpio_seq;
    mpsoc_demo_qspi_sequence     mpsoc_demo_qspi_seq;
    mpsoc_demo_switch_sequence     mpsoc_demo_switch_seq;
    mpsoc_demo_miiphy_sequence     mpsoc_demo_miiphy_seq;
    mpsoc_demo_efuse_sequence     mpsoc_demo_efuse_seq;
    mpsoc_demo_i2c_sequence     mpsoc_demo_i2c_seq;
    mpsoc_demo_spi_sequence     mpsoc_demo_spi_seq;
    mpsoc_demo_wdt_sequence     mpsoc_demo_wdt_seq;
    mpsoc_demo_tim_sequence     mpsoc_demo_tim_seq;
    mpsoc_demo_dma_sequence     mpsoc_demo_dma_seq;
    mpsoc_demo_sdram_sequence     mpsoc_demo_sdram_seq;

	`uvm_object_utils(mpsoc_demo_sequence)

	function new(string name="mpsoc_demo_sequence");
		super.new(name);
		`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
			mpsoc_demo_sysctrl_seq=mpsoc_demo_sysctrl_sequence::type_id::create("mpsoc_demo_sysctrl_seq");
			mpsoc_demo_jtag_seq=mpsoc_demo_jtag_sequence::type_id::create("mpsoc_demo_jtag_seq");
			mpsoc_demo_uart_seq=mpsoc_demo_uart_sequence::type_id::create("mpsoc_demo_uart_seq");
			mpsoc_demo_gpio_seq=mpsoc_demo_gpio_sequence::type_id::create("mpsoc_demo_gpio_seq");
			mpsoc_demo_qspi_seq=mpsoc_demo_qspi_sequence::type_id::create("mpsoc_demo_qspi_seq");
			mpsoc_demo_switch_seq=mpsoc_demo_switch_sequence::type_id::create("mpsoc_demo_switch_seq");
			mpsoc_demo_miiphy_seq=mpsoc_demo_miiphy_sequence::type_id::create("mpsoc_demo_miiphy_seq");
			mpsoc_demo_efuse_seq=mpsoc_demo_efuse_sequence::type_id::create("mpsoc_demo_efuse_seq");
			mpsoc_demo_i2c_seq=mpsoc_demo_i2c_sequence::type_id::create("mpsoc_demo_i2c_seq");
			mpsoc_demo_spi_seq=mpsoc_demo_spi_sequence::type_id::create("mpsoc_demo_spi_seq");
			mpsoc_demo_wdt_seq=mpsoc_demo_wdt_sequence::type_id::create("mpsoc_demo_wdt_seq");
			mpsoc_demo_tim_seq=mpsoc_demo_tim_sequence::type_id::create("mpsoc_demo_tim_seq");
			mpsoc_demo_dma_seq=mpsoc_demo_dma_sequence::type_id::create("mpsoc_demo_dma_seq");
			mpsoc_demo_sdram_seq=mpsoc_demo_sdram_sequence::type_id::create("mpsoc_demo_sdram_seq");
		`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	virtual task body();
		`uvm_info(get_full_name(),"body() begin ...",UVM_LOW)
			//add your transaction or sequence_lib
			fork
				begin
				   mpsoc_demo_sysctrl_seq.start(p_sequencer.sysctrl_seqr);
				end
				begin
				   mpsoc_demo_jtag_seq.start(p_sequencer.jtag_seqr);
				end
				begin
				   mpsoc_demo_uart_seq.start(p_sequencer.uart_seqr);
				end
				begin
				   mpsoc_demo_gpio_seq.start(p_sequencer.gpio_seqr);
				end
				begin
				   mpsoc_demo_qspi_seq.start(p_sequencer.qspi_seqr);
				end
				begin
				   mpsoc_demo_switch_seq.start(p_sequencer.switch_seqr);
				end
				begin
				   mpsoc_demo_miiphy_seq.start(p_sequencer.miiphy_seqr);
				end
				begin
				   mpsoc_demo_efuse_seq.start(p_sequencer.efuse_seqr);
				end
				begin
				   mpsoc_demo_i2c_seq.start(p_sequencer.i2c_seqr);
				end
				begin
				   mpsoc_demo_spi_seq.start(p_sequencer.spi_seqr);
				end
				begin
				   mpsoc_demo_wdt_seq.start(p_sequencer.wdt_seqr);
				end
				begin
				   mpsoc_demo_tim_seq.start(p_sequencer.tim_seqr);
				end
				begin
				   mpsoc_demo_dma_seq.start(p_sequencer.dma_seqr);
				end
				begin
				   mpsoc_demo_sdram_seq.start(p_sequencer.sdram_seqr);
				end
			join
		`uvm_info(get_full_name(),"body end ...",UVM_LOW)
	endtask

endclass

class mpsoc_demo_test extends mpsoc_base_test;

	mpsoc_demo_sequence  mpsoc_demo_seq;

	`uvm_component_utils(mpsoc_demo_test)

	function new(string name="mpsoc_demo_test",uvm_component parent=null);
		super.new(name,parent);
		`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		mpsoc_demo_seq=mpsoc_demo_sequence::type_id::create("mpsoc_demo_seq");
		`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	//run_phase
	virtual task run_phase(uvm_phase phase);
		super.run_phase(phase);
		`uvm_info(get_full_name(),"run_phase begin ...",UVM_LOW)
		phase.raise_objection(this);
		@(posedge mpsocvif.rstn);
		mpsoc_demo_seq.start(env.mpsoc_vseqr);
		#1us;
		phase.drop_objection(this);
		`uvm_info(get_full_name(),"run_phase end ...",UVM_LOW)
	endtask


endclass

`endif
