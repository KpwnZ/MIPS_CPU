`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/16 01:21:18
// Design Name: 
// Module Name: sim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sim(

    );
    
    reg clk, rst;
    wire[31:0] wd, daddr;
    
    top mips_top(.clk(clk), .rst(rst), .writedata(wd), .dataaddr(daddr));
    
    initial begin
        clk = 0;
        rst = 0;
        #1;
        rst = 1;
        #1;
        rst = 0;
    end
    
    always begin
        #2; clk = 1;
        #2; clk = 0;
    end
endmodule
