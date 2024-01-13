library verilog;
use verilog.vl_types.all;
entity Register_File is
    generic(
        width           : integer := 32;
        address_lines   : integer := 5
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        WE3             : in     vl_logic;
        WD3             : in     vl_logic_vector;
        A1              : in     vl_logic_vector;
        A2              : in     vl_logic_vector;
        A3              : in     vl_logic_vector;
        RD1             : out    vl_logic_vector;
        RD2             : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width : constant is 1;
    attribute mti_svvh_generic_type of address_lines : constant is 1;
end Register_File;
