`ifndef _CANFD_EVENT_SV_
`define _CANFD_EVENT_SV_

//=========================================================================
// canfd_event: 【已废弃】保留仅为向后兼容
//   新设计应使用 uvm_event_pool::get_global() 直接获取全局事件
//   例如: uvm_event_pool::get_global("clk_evt").trigger();
//=========================================================================
class canfd_event extends uvm_object;

	`uvm_object_utils(canfd_event)

	function new(string name="canfd_event");
		super.new(name);
	endfunction : new

endclass : canfd_event

`endif
