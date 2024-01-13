library verilog;
use verilog.vl_types.all;
entity cash_array is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        refill          : in     vl_logic;
        update          : in     vl_logic;
        address         : in     vl_logic_vector(9 downto 0);
        write_data      : in     vl_logic_vector(31 downto 0);
        main_data       : in     vl_logic_vector(127 downto 0);
        valid           : out    vl_logic;
        cash_tagged     : out    vl_logic_vector(2 downto 0);
        read_data       : out    vl_logic_vector(31 downto 0)
    );
end cash_array;
