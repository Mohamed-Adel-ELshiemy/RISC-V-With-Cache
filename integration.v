module integration 
(
    input  clk , rst , MemWrite , MemRead ,
    input  [9:0]Address ,
    input  [31:0]Data_in_CPU ,
    output  [31:0]Data_out_cpu ,
    output  stall
);
wire ready_signal_memory , valid_cache , refill , write_en_memory , read_en_cache , read_en_memory , update ;
wire [2:0]tag_cache ;
wire [31:0]Data_out_system ;
wire [127:0]Data_mem_cache;



cache_controller control (

    .clk                         (clk)                        ,
    .rst                         (rst)                        ,
    .Memwrite                    (MemWrite)                   ,
    .Memread                     (MemRead)                    ,
    .ready_signal_memory         (ready_signal_memory)        ,
    .valid_cache                 (valid_cache)                ,
    .address                     (Address)                    ,
    .tag_cache                   (tag_cache)                  ,
    .Data_in                     (Data_in_CPU)                ,
    .Data_out                    (Data_out_system)            ,
    .stall                       (stall)                      ,
    .refill                      (refill)                     ,
    .write_en_memory             (write_en_memory)            ,
    .read_en_cache               (read_en_cache )             ,
    .read_en_memory              (read_en_memory)             ,
    .update                      (update )
) ;

cash_array cash (
  
     .clk                         (clk)                        ,
     .rst                         (rst)                        , 
     .refill                      (refill)                     ,
     .update                      (update)                     ,
     .address                     (Address)                    ,
     .write_data                  (Data_out_system)            ,
     .main_data                   (Data_mem_cache)             ,
     .valid                       (valid_cache)                ,
     .cash_tagged                 (tag_cache)                  ,
     .read_data                   (Data_out_cpu)
);
data_memory Dmm (

    .clk                          (clk)                        ,
    .rst                          (rst)                        , 
    .write_en_memory              (write_en_memory)            ,
    .read_en_memory               (read_en_memory)             ,
    .DataIn                       (Data_out_system)            ,
    .address                      (Address)                    ,
    .ready_signal_memory          (ready_signal_memory)        ,
    .DataOut                      (Data_mem_cache)
) ;



endmodule