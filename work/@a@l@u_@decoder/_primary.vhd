library verilog;
use verilog.vl_types.all;
entity ALU_Decoder is
    port(
        op              : in     vl_logic;
        ALUOp           : in     vl_logic_vector(1 downto 0);
        funct3          : in     vl_logic_vector(2 downto 0);
        funct7          : in     vl_logic;
        ALUControl      : out    vl_logic_vector(2 downto 0)
    );
end ALU_Decoder;
