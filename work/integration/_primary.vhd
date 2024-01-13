library verilog;
use verilog.vl_types.all;
entity integration is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        MemWrite        : in     vl_logic;
        MemRead         : in     vl_logic;
        Address         : in     vl_logic_vector(9 downto 0);
        Data_in_CPU     : in     vl_logic_vector(31 downto 0);
        Data_out_cpu    : out    vl_logic_vector(31 downto 0);
        stall           : out    vl_logic
    );
end integration;
