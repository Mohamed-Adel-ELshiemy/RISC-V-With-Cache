module cash_array 
(
input clk, rst, refill, update,
input [9:0] address,
input [31:0] write_data,
input [127:0] main_data,

output valid,
output [2:0] cash_tagged,
output reg [31:0] read_data
);


reg [131:0] cache_array [0:31];    //32 block each of 128 bit data + 3 bit tag + 1 valid bit
integer i;
wire [1:0] offset;
wire [4:0] index;
wire [2:0] tag;

always @ (posedge clk or negedge rst) begin
	if (rst==0) begin           //reset all valid bits and tag fields to zero
		for (i=0; i<32; i=i+1)
		cache_array[i] [131:128] <=0;
	end

	else if (refill) begin                  //fill a whole block of cash with data from main (in case of read miss)
		cache_array [index] [127:0] = main_data;
		cache_array [index] [131]=1'b1;            //update valid to 1
		cache_array [index] [130:128]= tag;        //update tag 

	end
	else if (update) begin                  //write new data word in its place in cash (in case of write hit)
		case (offset)
		2'b00: cache_array [index] [31:0] = write_data;
		2'b01: cache_array [index] [63:32] = write_data;
		2'b10: cache_array [index] [95:64] = write_data;
		2'b11: cache_array [index] [127:96] = write_data;
	endcase
	end	

end

//read data
always @(*) begin 
	case (offset)
		2'b00: read_data = cache_array [index] [31:0];
		2'b01: read_data = cache_array [index] [63:32];
		2'b10: read_data = cache_array [index] [95:64];
		2'b11: read_data = cache_array[index] [127:96];
	endcase

end

assign offset = address[1:0];
assign index = address[6:2];
assign tag = address[9:7];
assign valid = cache_array [index] [131] ;
assign cash_tagged = cache_array [index] [130:128];

endmodule