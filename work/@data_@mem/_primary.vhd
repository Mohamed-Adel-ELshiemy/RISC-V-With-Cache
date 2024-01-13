library verilog;
use verilog.vl_types.all;
entity Data_Mem is
    generic(
        width           : integer := 32;
        address_lines   : integer := 32
    );
    port(
        clk             : in     vl_logic;
        WE              : in     vl_logic;
        WD              : in     vl_logic_vector;
        A               : in     vl_logic_vector;
        RD              : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width : constant is 1;
    attribute mti_svvh_generic_type of address_lines : constant is 1;
end Data_Mem;
