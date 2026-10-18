`ifndef _AHB_MASTER_IF_SV_
`define _AHB_MASTER_IF_SV_

// AHB 主机接口(参考飞书文档「ahb_master_if」)
// 用途:通过 force 把 DUT 两个 CPU 子系统(kcore0/kcore1)的 AHB 主机端口桥接到 TB。
interface ahb_master_if (input hclk, input hresetn);

    bit [31:0] haddr;
    bit [1:0]  htrans;
    bit        hwrite;
    bit [2:0]  hsize;
    bit [2:0]  hburst;
    bit [3:0]  hprot;
    bit [31:0] hwdata;
    bit [31:0] hrdata;
    bit        hready;
    bit        hresp;
    bit        error;

    task automatic write(
        input  logic [31:0] addr,
        input  logic [31:0] data,
        input  logic [2:0]  size = 3'b010 /*, output logic error = 1'b0*/ );
        //stage1: 地址相位
        @(posedge hclk);
        htrans = 2'b10;
        haddr  = addr;
        hwrite = 1'b1;
        hsize  = size;
        hburst = 3'b0;
        hprot  = 4'b0011;
        hwdata = data;
        //stage2: 数据相位
        @(posedge hclk);
        //hwdata = data;
        do @(posedge hclk); while (hready !== 1'b1);
        //stage3: 响应结束
        error  = hresp;
        htrans = 2'b00;
        hwrite = 1'b0;
        //hwdata = 'h0;
    endtask

    task automatic read(
        input  logic [31:0] addr,
        output logic [31:0] data,
        input  logic [2:0]  size = 3'b010 /*, output logic error = 1'b0*/ );
        //stage1: 地址相位
        @(posedge hclk);
        htrans = 2'b10;
        haddr  = addr;
        hwrite = 1'b0;
        hsize  = size;
        hburst = 3'b0;
        hprot  = 4'b0011;
        //stage2: 数据相位
        @(posedge hclk);
        do @(posedge hclk); while (hready !== 1'b1);
        //stage3: 响应结束
        data   = hrdata;
        error  = hresp;
        htrans = 2'b00;
    endtask

    task automatic write_burst(
        input logic [31:0] addr,
        input logic [31:0] data [4],
        input logic [2:0]  size = 3'b010 );
        int i;
        //stage1: 地址相位
        @(posedge hclk);
        htrans = 2'b10;
        haddr  = addr;
        hwrite = 1'b1;
        hsize  = size;
        hburst = 3'b011;
        hprot  = 4'b0011;
        //stage2: 首拍
        @(posedge hclk);
        hwdata = data[0];
        haddr  = addr + (1 << size);
        htrans = 2'b11;
        do @(posedge hclk); while (hready !== 1'b1);
        //stage3: 后续拍
        for (i = 1; i < 4; i++) begin
            hwdata = data[i];
            if (i < 3) begin
                haddr  = addr + ((i+1) << size);
                htrans = 2'b11;
            end
            else begin
                htrans = 2'b00;
            end
            do @(posedge hclk); while (hready !== 1'b1);
        end
        //stage4: 结束
        hwrite = 1'b0;
        hwdata = 'h0;
    endtask

endinterface

`endif
