library verilog;
use verilog.vl_types.all;
entity Inst_Mem is
    generic(
        width           : integer := 32
    );
    port(
        A               : in     vl_logic_vector;
        RD              : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width : constant is 1;
end Inst_Mem;
