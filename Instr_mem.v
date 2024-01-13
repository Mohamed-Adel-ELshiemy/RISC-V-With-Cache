module Inst_Mem#(parameter width   = 32)
    (
        input  [width-1:0] A,
        output [width-1:0] RD
    );

    reg [width-1:0] memory [0:width*2-1];

    /* Initialize Instruction Memory with machine code of program */
    initial begin
      // $readmemh("GCD_Machine_Code.txt", memory);
	$readmemh("Fibonacci_Machine_Code.txt", memory);
	//$readmemh("Factorial_Machine_Code.txt", memory);
    end

    assign RD = memory[A[31:2]];
endmodule

