`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/27 10:20:18
// Design Name: 
// Module Name: clk_div
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


module clk_div(
    input [0:0]clk,
    output [0:0]dived_clk
    );
    reg [0:0]div_clk = 1'b0;
    assign dived_clk = div_clk;
    reg [31:0]count = 0; 
    //45000000
    parameter T1MS=50000000;
    always@(posedge clk)   
       begin     
           count<=count+1;    
               if(count==T1MS)    
                   begin
                        count <= 0;  
                        div_clk <= ~div_clk;
                   end   
       end 
    
endmodule
