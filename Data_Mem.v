module Data_Mem#(parameter width = 32,parameter address_lines = 32 )
 (
    input clk, WE,
    input [width-1:0] WD, 
    input [address_lines-1:0] A, 
    output [width-1:0] RD
);
    reg [width-1:0] memory [0:width*2-1]; 
    always @(posedge clk) begin
        if (WE) begin
            memory[A] <= WD;
        end
    end
    assign RD = memory[A];

endmodule

