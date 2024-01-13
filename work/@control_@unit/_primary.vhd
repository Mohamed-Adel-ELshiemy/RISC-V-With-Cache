library verilog;
use verilog.vl_types.all;
entity Control_Unit is
    port(
        op              : in     vl_logic_vector(6 downto 0);
        Zero            : in     vl_logic;
        Sign            : in     vl_logic;
        funct7          : in     vl_logic;
        funct3          : in     vl_logic_vector(2 downto 0);
        PCSrc           : out    vl_logic;
        ResultSrc       : out    vl_logic;
        MemWrite        : out    vl_logic;
        ALUSrc          : out    vl_logic;
        RegWrite        : out    vl_logic;
        MemRead         : out    vl_logic;
        ImmSrc          : out    vl_logic_vector(1 downto 0);
        ALUControl      : out    vl_logic_vector(2 downto 0)
    );
end Control_Unit;
