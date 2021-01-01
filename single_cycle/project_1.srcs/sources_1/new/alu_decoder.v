`timescale 1ns / 1ps
module alu_dec(
    input [1:0]aluop,
    input [5:0]funct,
    output [2:0]alu_control
);
    reg [2:0] alu_control_output;
    assign alu_control = alu_control_output;
    always @(*) begin
        case(aluop)
            2'b00: alu_control_output <= 3'b010;
            2'b01: alu_control_output <= 3'b110;
            2'b10: case(funct)
                        6'b100000: alu_control_output <= 3'b010;
                        6'b100010: alu_control_output <= 3'b110;
                        6'b100100: alu_control_output <= 3'b000;
                        6'b100101: alu_control_output <= 3'b001;
                        6'b101010: alu_control_output <= 3'b111;
                        default:   alu_control_output <= 3'b111;
                   endcase
            default:alu_control_output <= 3'b000;
        endcase
    end

endmodule