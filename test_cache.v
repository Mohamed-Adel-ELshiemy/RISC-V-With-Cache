  
module cache_top_tb ();

reg   clk ;
reg   rst ;
reg MemWrite ;
reg MemRead ;
reg [9:0]Address ;
reg  [31:0]Data_in_CPU ;
wire [31:0]Data_out_cpu ;
wire stall;

integration top (
     .clk                         (clk)                          ,
     .rst                         (rst)                          , 
     .MemWrite                    (MemWrite)                     ,
     .MemRead                     (MemRead)                      ,
     .Address                     (Address)                      ,
     .Data_in_CPU                 (Data_in_CPU)                  ,
     .Data_out_cpu                (Data_out_cpu)                 ,
     .stall                        (stall)                        
     
);

 always #10 clk = ~clk;

 initial begin
	//testing reset
	clk=0;
	rst=0;
	Address= 32'b0010000000;                          //Address 128
	Data_in_CPU= 1;
	MemWrite=1;
	MemRead=1;

//wait 1 clk cycle and test write miss
#20;
rst=1;
//wait 5 cycles: 1 for idle state 4 for memory access
#100;                            //wait an extra cycle to memic the time the new unstructipn will come in
//check reading the same location --> read miss  

//to get new ins 
#10;

//write another location

Address= 32'b0010000001;                         //Address 129
Data_in_CPU= 2;
//to change state
#10;

#100;


#10;         //to get a new instruction
// put new inst
Address= 32'b0010000010;                              //Address 130
Data_in_CPU= 3;
#10;         //wait 10 to change state

#100;



#10;
Address= 32'b0010000011;                               //Address 131
Data_in_CPU= 4;
#10;
#100;


//wait 10 to fetch a new instruction
#10;
//testing read miss (nothing in cash yet)
Address= 32'b0010000000;
MemWrite=0;
//wait for neg edeg for controller to change to change state (go to read)
#10;
#100;              //for main mem access


#10; //testing read hit ------------> the whole block was transmitted
Address= 32'b0010000001;

//another read hit
#20;
Address= 32'b0010000010;
#10;


//testing read hit
#10;
Address= 32'b0010000011;

#20; //to fetch a new inst
//test write hit in
Address=32'b0010000010;
MemWrite=1;
Data_in_CPU=15;
#10;
#100;


//read that last location again --> read hit and make sure it's the updated data 15
#10;
//testing read miss (nothing in cash yet)
MemWrite=0;
//wait for neg edeg for controller to change to change state (go to read)
#20;


$stop;
	end 
	endmodule








