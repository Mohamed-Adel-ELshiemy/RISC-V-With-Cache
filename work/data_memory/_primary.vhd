library verilog;
use verilog.vl_types.all;
entity data_memory is
    generic(
        WIDTH           : integer := 32;
        ADDR_SIZE       : integer := 10
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        write_en_memory : in     vl_logic;
        read_en_memory  : in     vl_logic;
        DataIn          : in     vl_logic_vector;
        address         : in     vl_logic_vector;
        ready_signal_memory: out    vl_logic;
        DataOut         : out    vl_logic_vector(127 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
    attribute mti_svvh_generic_type of ADDR_SIZE : constant is 1;
end data_memory;
