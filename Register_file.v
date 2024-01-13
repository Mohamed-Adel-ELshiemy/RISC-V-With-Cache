module Register_File #(parameter width= 32,parameter address_lines = 5)
    (
        input  clk, rst, WE3, 
        input  [width-1:0] WD3,
        input  [address_lines-1:0] A1, A2, A3,

        output [width-1:0] RD1, RD2
    );

    reg [width-1:0] memory [0:width*2-1];

    integer i;
    initial begin
        for (i=0; i<32; i=i+1) begin
            memory[i] <= {width{1'b0}};
        end
    end
    
    always @(posedge clk, negedge rst) begin
        if (!rst) begin
            for (i = 0;i < width ;i=i+1 ) begin
                memory[i] <= {width{1'b0}};
            end
        end
        else if (WE3) begin
            memory[A3] <= WD3;
        end
    end

    assign RD1 = memory[A1];
    assign RD2 = memory[A2];

endmodule

