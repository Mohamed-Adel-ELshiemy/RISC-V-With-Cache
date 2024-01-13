module cache_controller 
(
    
  input clk , rst , Memwrite , Memread ,/* ready_signal_cache ,*/  ready_signal_memory , valid_cache ,
  input [9:0]address,
  input [2:0]tag_cache,
  input [31:0]Data_in,
 
  output [31:0]Data_out,
  output  reg stall,refill,write_en_memory, read_en_cache , read_en_memory , update
  );
  
 // reg [2:0] tag_array  [0:WIDTH-1];
  //reg valid_array      [0:WIDTH-1]; 
  reg [1:0] offset;
  reg [4:0] index;
  reg [2:0] tag;
  reg cache_hit;
  localparam Idle = 2'b00 ;
  localparam Read = 2'b01 ;
  localparam Write = 2'b10 ;
  
  reg [2:0]state_current;
  reg [2:0]state_next;
 
  assign Data_out = Data_in;
  always@(posedge clk or negedge rst ) 
   begin
    if(~rst)
      begin
      state_current <= Idle;
      end
   else
      begin
      state_current <= state_next;
      end
   end
   
 always@(*)begin
       if (tag != tag_cache || valid_cache!=1)
          begin
			       cache_hit <= 0; 
			     end
       else if (tag == tag_cache&& valid_cache==1)
          begin  
			        cache_hit <= 1; 
			    end
   end
	always@(*)begin
	
	case (state_current)
            Idle:  // Idle state
               if (Memread && cache_hit)
                 begin
                   // Cache hit
                    stall <= 1'b0;
                    state_next <= Read; // Move to reading state
                 end
               else if (Memread && !cache_hit)
                  begin
                    // Cache miss, set stall
                    stall <= 1'b1;
                    state_next <= Read; // Move to reading state
                  end 
                else if (Memwrite && cache_hit)
                   begin
                    // Cache hit for write
                    stall <= 1'b1;
                    state_next <= Write; // Move to writing state
                   end 
                else if (Memwrite && !cache_hit)
                   begin
                    // Cache miss for write
                    stall <= 1'b1;
                    state_next <= Write; // Move to writing state
                    end
                 else 
                   begin
                    // No operation
                    stall <= 1'b0;
                    refill <= 1'b0;
					write_en_memory <= 1'b0;
					read_en_memory <= 1'b0;
					update <= 1'b0;
                   end
			    
			    Read: // Reading state
			        if (cache_hit) 
			          begin
			          stall <= 1'b0;
			          read_en_cache <= 1'b1;
					 
		            end
             else if (!cache_hit)
                 begin
	                 refill <= 1'b1;
	                 read_en_memory <= 1'b1;
					 write_en_memory <= 1'b1;
	                 stall <= 1'b1;
	                 
		               if ( ready_signal_memory == 1)
		                    begin
                         // Data from memory is available
                          state_next <=Idle; // Move back to idle state
                          stall <= 1'b0;
                     end
                  end
                     
		       Write: // Writing state
               if (cache_hit)begin
		               update <= 1'b1; 
               	       write_en_memory <= 1'b1;
           	           stall <= 1'b1;
                  if (ready_signal_memory == 1)
                     begin
				             // Memory finished writing
                       state_next <= Idle; // Move back to idle state
          	             stall <= 1'b0;
                    	        end 
                         end
		           else	if (!cache_hit)
		               begin 
					       update <= 1'b0; 
			               write_en_memory <= 1'b1;
			               stall <= 1'b1;
			            
		              if (ready_signal_memory)
		                begin
                    		// Memory finished writing
                      state_next <= Idle; // Move back to idle state
               	      stall <= 1'b0; 
               	       end
             	       end
              
        endcase
    end


always @(*)
 begin 
 offset    = address [1:0];
 index     = address [6:2];
 tag       = address [9:7];
end

endmodule                 
			    
			 
  
