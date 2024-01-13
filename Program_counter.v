module PC#(parameter width = 32)
    (
        input clk, rst, stall,
        input [width-1:0] PCNext,
        output reg [width-1:0] PC
    );

    always @(posedge clk, negedge rst) begin
        if (!rst) begin
            PC <= {width{1'b0}};
        end
        else if (stall==0) begin
            PC <= PCNext;
        end
    end
endmodule

