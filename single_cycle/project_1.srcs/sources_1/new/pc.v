`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/27 10:21:18
// Design Name: 
// Module Name: pc
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


module pc(
    input clk,
    input rst,
    input wire [31:0] datain,
    output wire [31:0] pc_out
    );
    reg [31:0] pc;
    assign pc_out = pc;
    initial begin
        pc = 2'b00000000_00000000_00000000_00000000;
    end
    
    always @(negedge clk, posedge rst) begin
    if(rst) pc <= 0;
    else pc <= datain;
    end 
    
endmodule
