module data_memory #(parameter WIDTH = 32, parameter ADDR_SIZE = 10)
(
  input clk, rst, write_en_memory, read_en_memory,
  input [WIDTH-1:0] DataIn,
  input [ADDR_SIZE-1:0] address,
  output reg ready_signal_memory,
  output reg [127:0] DataOut
);

  reg [WIDTH-1:0] memory_array [0:1023]; // 4Kbyte
  integer i;
  reg [2:0] counter;

  always @(posedge clk, negedge rst) begin
    if (!rst) begin
      DataOut <= 0;
      counter <= 0;
      for (i = 0; i < WIDTH; i = i + 1) begin
        memory_array[i] <= 0;
      end
      ready_signal_memory <= 0;
    end else begin
      if (write_en_memory == 1) begin
        memory_array[address] <= DataIn;
        ready_signal_memory <= 1;
      end else begin
        memory_array[address] <= memory_array[address];
        ready_signal_memory <= 0;
      end
    end
  end

  always @(posedge clk) begin
    if (read_en_memory == 1) begin
      case (counter)
        0: DataOut[31:0] <= memory_array[{address[9:2], 2'b00}];
        1: DataOut[63:32] <= memory_array[{address[9:2], 2'b01}];
        2: DataOut[95:64] <= memory_array[{address[9:2], 2'b10}];
        3: DataOut[127:96] <= memory_array[{address[9:2], 2'b11}];
        default: begin
          // Do nothing or handle other cases as needed
        end
      endcase
         if (counter < 4) begin
             counter <= counter + 1;
            end 
          else begin
             counter <= 0;
             ready_signal_memory <= 1; // Set ready signal after counter equals 4
            end
   
    end
     
    end 
  

endmodule
