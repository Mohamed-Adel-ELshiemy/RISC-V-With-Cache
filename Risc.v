module RISCV #(parameter width = 32)
(
    input clk, rst
);
    wire [width-1: 0] PCNext, PC, Instr, SrcA, SrcB, ALUResult, ReadData, WriteData, PCPluse4, PCTarget, ImmExt, Result;
    wire Zero, Sign, stall, PCSrc, ResultSrc, MemWrite, MemRead , ALUSrc, RegWrite;
    wire [2:0] ALUControl;
    wire [1:0] ImmSrc;

 
    PC_Calc P0 (
        .PCSrc(PCSrc),
        .ImmExt(ImmExt), 
        .PC(PC), 
        .PCNext(PCNext)
        );

    PC      P1 (
        .PCNext(PCNext), 
        .clk(clk), 
        .rst(rst), 
        .stall(stall), 
        .PC(PC)
        );

    Inst_Mem M0 (
        .A(PC), 
        .RD(Instr)
        );

    Register_File R0 (
        .WD3(Result), 
        .A1(Instr[19:15]), 
        .A2(Instr[24:20]), 
        .A3(Instr[11:7]), 
        .clk(clk), 
        .rst(rst), 
        .WE3(RegWrite), 
        .RD1(SrcA), 
        .RD2(WriteData)
        );

    /* Extend */
    Extend E0 (
        .Instr(Instr), 
        .ImmSrc(ImmSrc), 
        .ImmExt(ImmExt)
        );

    /* ALUSrc Selction */
    Mux X0 (
        .In1(WriteData), 
        .In2(ImmExt), 
        .sel(ALUSrc), 
        .out(SrcB)
        );

    /* ALU */
    ALU A0 (
        .SrcA(SrcA), 
        .SrcB(SrcB), 
        .ALUControl(ALUControl), 
        .ALUResult(ALUResult), 
        .Zero(Zero), 
        .Sign(Sign)
        );


    /* Data Memory */
   
        integration top (
     .clk                         (clk)                          ,
     .rst                         (rst)                          , 
     .MemWrite                    (MemWrite)                     ,
     .MemRead                     (!MemWrite)                      , //there is a problem in memread we work on it but this is accurate 90%
     .Address                     (ALUResult[9:0])                      ,
     .Data_in_CPU                 (WriteData)                  ,
     .Data_out_cpu                (ReadData)                 ,
     .stall                        (stall)                        
        );
    /* ResultSrc Selection */
    Mux X1 (
        .In1(ALUResult), 
        .In2(ReadData), 
        .sel(ResultSrc), 
        .out(Result)
        );

    /* Control Unit */
    Control_Unit C0 (
        .op(Instr[6:0]),
        .funct3(Instr[14:12]), 
        .funct7(Instr[30]), 
        .Zero(Zero), 
        .Sign(Sign), 
        .PCSrc(PCSrc), 
        .ResultSrc(ResultSrc), 
        .MemWrite(MemWrite), 
        .MemRead(MemRead),
        .ALUSrc(ALUSrc), 
        .RegWrite(RegWrite), 
        .ImmSrc(ImmSrc), 
        .ALUControl(ALUControl)
        );

endmodule
