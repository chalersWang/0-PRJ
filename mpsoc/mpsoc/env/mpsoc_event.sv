`ifndef _MPSOC_EVENT_SV_
`define _MPSOC_EVENT_SV_

//=========================================================================
// mpsoc_event: 【已废弃】保留仅为向后兼容
//   新设计应使用 uvm_event_pool::get_global() 直接获取全局事件
//   例如: uvm_event_pool::get_global("clk_evt").trigger();
//=========================================================================
class mpsoc_event extends uvm_object;

	`uvm_object_utils(mpsoc_event)

	function new(string name="mpsoc_event");
		super.new(name);
	endfunction : new

endclass : mpsoc_event

`endif
