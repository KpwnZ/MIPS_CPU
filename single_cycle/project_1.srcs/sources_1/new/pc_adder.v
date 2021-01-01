`timescale 1ns / 1ps


module adder (
    input [31:0] datain,
    input [31:0] datainb,
    output [31:0] dataout
    );
    
    assign dataout = datain + datainb;
    
endmodule
