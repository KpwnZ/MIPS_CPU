`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/20 10:24:43
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input rst,
    output wire[31:0] writedata, dataaddr,
    output wire memwrite
    );
    
    wire[31:0] pc, instr, readdata;
    wire [31:0]ii;
    wire c;
    wire [7:0] pc_shrink;
    
    reg [7:0] cnt = 8'b0000_0000;
    
    always @(posedge clk) begin
       cnt <= cnt+1;
    end
    
    
    mips mips(.clk(clk), .rst(rst), .instr(instr), .pc(pc), .memwrite(memwrite), .aluout(dataaddr), .writedata(writedata), .readdata(readdata));
    ins_rom ins(.clka(clk), .addra(pc[9:2]), .douta(instr));
    data_rom data(.clka(~clk), .wea(memwrite), .ena(memwrite), .addra(dataaddr[9:2]), .dina(writedata), .douta(readdata));
   
endmodule
