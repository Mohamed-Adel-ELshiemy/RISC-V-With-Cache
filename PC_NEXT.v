module PC_Calc#(parameter width = 32)
    (
        input [width-1:0] ImmExt, PC,
        input PCSrc,
        output reg [width-1:0] PCNext
    );

    always @(*) begin
        if (PCSrc) begin
            PCNext <= PC + ImmExt;            
        end
        else begin
            PCNext <= PC + 32'd4;
        end
    end
endmodule

