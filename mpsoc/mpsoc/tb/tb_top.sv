module tb_top;                          

import uvm_pkg::*;

//import svt_uvm_pkg::*;

import mpsoc_TestTop::*;                   


`include "crg_gen.sv"


`include "uvmconfigdb.sv"   


`include "dutinst.sv"  


`include "dumpctrl.sv"


endmodule
