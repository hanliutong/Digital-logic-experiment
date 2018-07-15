library verilog;
use verilog.vl_types.all;
entity shifting_register is
    port(
        Clk             : in     vl_logic;
        Data            : in     vl_logic_vector(3 downto 0);
        Mode            : in     vl_logic_vector(1 downto 0);
        Dout0           : out    vl_logic_vector(3 downto 0);
        Dout1           : out    vl_logic_vector(3 downto 0);
        Dout2           : out    vl_logic_vector(3 downto 0);
        Dout3           : out    vl_logic_vector(3 downto 0);
        Dout4           : out    vl_logic_vector(3 downto 0);
        Dout5           : out    vl_logic_vector(3 downto 0);
        Dout6           : out    vl_logic_vector(3 downto 0);
        Dout7           : out    vl_logic_vector(3 downto 0);
        F               : in     vl_logic
    );
end shifting_register;
