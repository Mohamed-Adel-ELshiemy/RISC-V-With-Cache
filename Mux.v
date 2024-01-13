module Mux #(parameter  width = 32)
    (
        input[width-1:0] In1, In2,
        input sel,
        output [width-1:0] out
    );

    assign out = sel ? In2 : In1;
endmodule

