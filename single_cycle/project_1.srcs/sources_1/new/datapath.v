module datapath(
    input wire clk,
    input wire rst,
    input wire memtoreg, pcsrc, alusrc, regdst, regwrite, jump,
    input wire[2:0] alucontrol,
    input wire[31:0] instr,
    input wire[31:0] readdata,
    output wire overflow, zero,
    output wire[31:0] pc,
    output wire[31:0] aluout, writedata
    );
    
    wire [31:0] srca; wire [31:0] srcb; // from reg file
    wire [31:0] rdata2_from_regfile;
    wire [31:0] ext;
    wire [31:0] alusrc_mux_out;
    wire [31:0] pc_in1, pc_in2;
    wire [31:0] pcplus4, pcbranch, pc_jump;
    wire [31:0] signimm, signsl;
    wire [31:0] result;
    wire [4:0] writereg;
    wire [31:0] debug;
    assign pc_src_src = pcsrc;
    assign pc_jump = {pcplus4[31:28], instr[25:0], 2'b00};
        
    pc pc_reg(.rst(rst), .clk(clk), .datain(pc_in2), .pc_out(pc));
    adder pc_adder(.datain(pc), .datainb(32'b100), .dataout(pcplus4));
    signext signextender(.a(instr[15:0]), .y(signimm));
    sl2 signextensl(.a(signimm), .y(signsl));
    adder pc_branch_adder(.datain(signsl), .datainb(pcplus4), .dataout(pcbranch));
    
    assign pc_in2 = jump ? pc_jump :
                    pcsrc ? pcbranch : pcplus4;
//    mux #(32) pc_mux(.a(pcbranch), .b(pcplus4), .y(pc_in1), .signal(pcsrc));   // if signal then output a
//    mux #(32) pc_jump_mux(.a({pcplus4[31:28], instr[25:0], 2'b00}), .b(pc_in1), .y(pc_in2), .signal(jump));
    
    regfile main_regfile(.raddr1(instr[25:21]), .raddr2(instr[20:16]), .rdata1(srca), 
                         .rdata2(rdata2_from_regfile), .clk(clk),
                         .waddr(writereg), .wdata(result), .we(regwrite));
    assign writedata = rdata2_from_regfile;
    mux #(32) srcb_mux(.signal(alusrc),.a(signimm), .b(rdata2_from_regfile),  .y(srcb)); // if alusrc then output a
    mux #(5) writereg_mux(.signal(regdst), .a(instr[15:11]), .b(instr[20:16]), .y(writereg)); // if regdst then output a
    mux #(32) res_mux(.signal(memtoreg), .a(readdata), .b(aluout), .y(result));
    // alu
    alu main_alu(.a(srca), .b(srcb), .op(alucontrol), .y(aluout), .zero(zero), .overflow(overflow));
    
endmodule
