library verilog;
use verilog.vl_types.all;
entity cache_controller is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        Memwrite        : in     vl_logic;
        Memread         : in     vl_logic;
        ready_signal_memory: in     vl_logic;
        valid_cache     : in     vl_logic;
        address         : in     vl_logic_vector(9 downto 0);
        tag_cache       : in     vl_logic_vector(2 downto 0);
        Data_in         : in     vl_logic_vector(31 downto 0);
        Data_out        : out    vl_logic_vector(31 downto 0);
        stall           : out    vl_logic;
        refill          : out    vl_logic;
        write_en_memory : out    vl_logic;
        read_en_cache   : out    vl_logic;
        read_en_memory  : out    vl_logic;
        update          : out    vl_logic
    );
end cache_controller;
