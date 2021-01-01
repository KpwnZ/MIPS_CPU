`timescale 1ns / 1ps
module main_dec(
    input [5:0] opcode,
    output alusrc,
    output memwrite,
    output memtoreg,
    output regwrite,
    output regdst,
    output branch,
    output jump,
    output [1:0]aluop
);
    reg [8:0] control_output;
    assign {regwrite, regdst, alusrc, branch, memwrite, memtoreg, jump, aluop} = control_output;
    
    always @(*) begin
        case(opcode)
            6'b000000: control_output <= 9'b110000010;  // r-type
            6'b100011: control_output <= 9'b101001000;  // lw
            6'b101011: control_output <= 9'b001010000;  // sw
            6'b000100: control_output <= 9'b000100001;  // beq
            6'b001000: control_output <= 9'b101000000;  // addi
            6'b000010: control_output <= 9'b000000100;  // j
            default:   control_output <= 9'b000000000;
        endcase
    end
endmodule