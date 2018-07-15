library verilog;
use verilog.vl_types.all;
entity KS8 is
    port(
        clk             : in     vl_logic;
        SW_IN           : in     vl_logic_vector(1 downto 0);
        SW_OUT          : out    vl_logic_vector(1 downto 0)
    );
end KS8;
