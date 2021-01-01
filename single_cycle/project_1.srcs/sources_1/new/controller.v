`timescale 1ns / 1ps
module controller(
    input [5:0] opcode,
    input [5:0] funct,
    input zero,
    output memtoreg,
    output memwrite,
    output regwrite,
    output regdst,
    output alusrc,
    output branch,
    output jump,
    output pcsrc,
    output [2:0]alu_control,
    output [10:0]led
);
    wire [1:0] aluop;
    assign pcsrc = branch & zero;
    main_dec main_decoder(.opcode(opcode), .alusrc(alusrc), .memwrite(memwrite), 
                          .regwrite(regwrite), .regdst(regdst), .branch(branch), 
                          .jump(jump), .aluop(aluop), .memtoreg(memtoreg));
    alu_dec alu_decoder(.aluop(aluop), .funct(funct), .alu_control(alu_control));
endmodule