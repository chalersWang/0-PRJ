`ifndef _MPSOC_DEMO_TEST_SV_
`define _MPSOC_DEMO_TEST_SV_

class mpsoc_demo_sysctrl_sequence extends sysctrl_sequence_lib;

    integer status;

    `uvm_object_utils(mpsoc_demo_sysctrl_sequence)

	function new(string name="mpsoc_demo_sysctrl_sequence");
		super.new(name);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	virtual task body();
		`uvm_info(get_full_name(),"body() begin ...",UVM_LOW)
		     `uvm_create(tr)
		     //status=tr.randomize();
		     status=tr.randomize with{};
		     if(!status)`uvm_fatal(get_full_name,"Can't randomize a trans!!!")
		     `uvm_send(tr)
		     //tr.print();
		     //get_response(rsp);
		`uvm_info(get_full_name(),"body end ...",UVM_LOW)
	endtask

endclass

class mpsoc_demo_jtag_sequence extends jtag_sequence_lib;

    integer status;

    `uvm_object_utils(mpsoc_demo_jtag_sequence)

	function new(string name="mpsoc_demo_jtag_sequence");
		super.new(name);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	virtual task body();
		`uvm_info(get_full_name(),"body() begin ...",UVM_LOW)
		     `uvm_create(tr)
		     //status=tr.randomize();
		     status=tr.randomize with{};
		     if(!status)`uvm_fatal(get_full_name,"Can't randomize a trans!!!")
		     `uvm_send(tr)
		     //tr.print();
		     //get_response(rsp);
		`uvm_info(get_full_name(),"body end ...",UVM_LOW)
	endtask

endclass

class mpsoc_demo_uart_sequence extends uart_sequence_lib;

    integer status;

    `uvm_object_utils(mpsoc_demo_uart_sequence)

	function new(string name="mpsoc_demo_uart_sequence");
		super.new(name);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	virtual task body();
		`uvm_info(get_full_name(),"body() begin ...",UVM_LOW)
		     `uvm_create(tr)
		     //status=tr.randomize();
		     status=tr.randomize with{};
		     if(!status)`uvm_fatal(get_full_name,"Can't randomize a trans!!!")
		     `uvm_send(tr)
		     //tr.print();
		     //get_response(rsp);
		`uvm_info(get_full_name(),"body end ...",UVM_LOW)
	endtask

endclass

class mpsoc_demo_gpio_sequence extends gpio_sequence_lib;

    integer status;

    `uvm_object_utils(mpsoc_demo_gpio_sequence)

	function new(string name="mpsoc_demo_gpio_sequence");
		super.new(name);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	virtual task body();
		`uvm_info(get_full_name(),"body() begin ...",UVM_LOW)
		     `uvm_create(tr)
		     //status=tr.randomize();
		     status=tr.randomize with{};
		     if(!status)`uvm_fatal(get_full_name,"Can't randomize a trans!!!")
		     `uvm_send(tr)
		     //tr.print();
		     //get_response(rsp);
		`uvm_info(get_full_name(),"body end ...",UVM_LOW)
	endtask

endclass

class mpsoc_demo_qspi_sequence extends qspi_sequence_lib;

    integer status;

    `uvm_object_utils(mpsoc_demo_qspi_sequence)

	function new(string name="mpsoc_demo_qspi_sequence");
		super.new(name);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	virtual task body();
		`uvm_info(get_full_name(),"body() begin ...",UVM_LOW)
		     `uvm_create(tr)
		     //status=tr.randomize();
		     status=tr.randomize with{};
		     if(!status)`uvm_fatal(get_full_name,"Can't randomize a trans!!!")
		     `uvm_send(tr)
		     //tr.print();
		     //get_response(rsp);
		`uvm_info(get_full_name(),"body end ...",UVM_LOW)
	endtask

endclass

class mpsoc_demo_switch_sequence extends switch_sequence_lib;

    integer status;

    `uvm_object_utils(mpsoc_demo_switch_sequence)

	function new(string name="mpsoc_demo_switch_sequence");
		super.new(name);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	virtual task body();
		`uvm_info(get_full_name(),"body() begin ...",UVM_LOW)
		     `uvm_create(tr)
		     //status=tr.randomize();
		     status=tr.randomize with{};
		     if(!status)`uvm_fatal(get_full_name,"Can't randomize a trans!!!")
		     `uvm_send(tr)
		     //tr.print();
		     //get_response(rsp);
		`uvm_info(get_full_name(),"body end ...",UVM_LOW)
	endtask

endclass

class mpsoc_demo_miiphy_sequence extends miiphy_sequence_lib;

    integer status;

    `uvm_object_utils(mpsoc_demo_miiphy_sequence)

	function new(string name="mpsoc_demo_miiphy_sequence");
		super.new(name);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	virtual task body();
		`uvm_info(get_full_name(),"body() begin ...",UVM_LOW)
		     `uvm_create(tr)
		     //status=tr.randomize();
		     status=tr.randomize with{};
		     if(!status)`uvm_fatal(get_full_name,"Can't randomize a trans!!!")
		     `uvm_send(tr)
		     //tr.print();
		     //get_response(rsp);
		`uvm_info(get_full_name(),"body end ...",UVM_LOW)
	endtask

endclass

class mpsoc_demo_efuse_sequence extends efuse_sequence_lib;

    integer status;

    `uvm_object_utils(mpsoc_demo_efuse_sequence)

	function new(string name="mpsoc_demo_efuse_sequence");
		super.new(name);
		//`uvm_info(get_full_name(),"new() begin ...",UVM_LOW)
		//`uvm_info(get_full_name(),"new() end ...",UVM_LOW)
	endfunction

	virtual task body();
		`uvm_info(get_full_name(),"body() begin ...",UVM_LOW)
		     `uvm_create(tr)
		     //status=tr.randomize();
		     status=tr.randomize with{};
		     if(!status)`uvm_fatal(get_full_name,"Can't randomize a trans!!!")
		     `uvm_send(tr)
		     //tr.print();
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
