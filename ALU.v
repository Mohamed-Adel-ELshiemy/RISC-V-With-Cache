module ALU #(parameter width = 32)
    (
        input [width-1:0] SrcA, SrcB,
        input [2:0] ALUControl,
        output reg [width-1:0] ALUResult,
        output reg Zero,
        output reg Sign
    );
    always @(*) begin
        case (ALUControl)
            3'b000:  ALUResult = SrcA + SrcB;      /* Addition      */
            3'b001:  ALUResult = SrcA << SrcB;     /* Shift Left    */ 
            3'b010:  ALUResult = SrcA - SrcB;      /* Subtracion    */
            3'b100:  ALUResult = SrcA ^ SrcB;      /* Xoring        */
            3'b101:  ALUResult = SrcA >> SrcB;     /* Shift Right   */ 
            3'b110:  ALUResult = SrcA | SrcB;      /* Oring         */ 
            3'b111:  ALUResult = SrcA & SrcB;      /* Anding        */
            default: ALUResult = {width{1'b0}};        /* reset result  */
        endcase
        /* Calculate Zero and Sign flag */
        Zero = ALUResult ? 1'b0 : 1'b1;
        Sign = ALUResult[width-1];
    end
endmodule
