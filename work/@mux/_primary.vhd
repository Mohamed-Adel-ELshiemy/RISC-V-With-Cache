library verilog;
use verilog.vl_types.all;
entity Mux is
    generic(
        width           : integer := 32
    );
    port(
        In1             : in     vl_logic_vector;
        In2             : in     vl_logic_vector;
        sel             : in     vl_logic;
        \out\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width : constant is 1;
end Mux;
