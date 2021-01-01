`timescale 1ns / 1ps

module mux #(parameter WIDTH = 8)(
    input [WIDTH-1:0]a, 
    input [WIDTH-1:0]b,
    input signal,
    output [WIDTH-1:0]y
    );
    assign y = signal ? a : b;
endmodule
