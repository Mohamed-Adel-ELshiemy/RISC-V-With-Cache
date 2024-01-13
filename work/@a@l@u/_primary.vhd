library verilog;
use verilog.vl_types.all;
entity ALU is
    generic(
        width           : integer := 32
    );
    port(
        SrcA            : in     vl_logic_vector;
        SrcB            : in     vl_logic_vector;
        ALUControl      : in     vl_logic_vector(2 downto 0);
        ALUResult       : out    vl_logic_vector;
        Zero            : out    vl_logic;
        Sign            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of width : constant is 1;
end ALU;
