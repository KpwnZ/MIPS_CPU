`timescale 1ns / 1ps

module sl2(
    input [31:0] a, 
    output [31:0] y
    );
    
assign y = (a << 2);

endmodule
