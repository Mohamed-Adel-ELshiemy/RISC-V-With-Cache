`timescale 1ns/1ns

module Top_Module_tb;
    
    reg clk, rst;
    integer i;
    RISCV T0 (.clk(clk), .rst(rst));

     always #10 clk = ~clk;

    initial begin
        $dumpfile("Top_Module.vcd");
        $dumpvars(0, Top_Module_tb);
        $display("GCD is %d", T0.R0.memory[2]);
        clk = 1'b0; rst=1'b0;
        #10 rst=1'b1;
        #10000
        $display("GCD is %d", T0.R0.memory[2]);
        #10 $finish;
    end
endmodule

