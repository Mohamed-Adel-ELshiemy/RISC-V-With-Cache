library verilog;
use verilog.vl_types.all;
entity PC_Calc is
    generic(
        width           : integer := 32
    );
    port(
        ImmExt          : in     vl_logic_vector;
        PC              : in     vl_logic_vector;
        PCSrc           : in     vl_logic;
        PCNext          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width : constant is 1;
end PC_Calc;
