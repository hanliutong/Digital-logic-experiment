library verilog;
use verilog.vl_types.all;
entity project5 is
    port(
        clk             : in     vl_logic;
        SW              : in     vl_logic;
        reset           : in     vl_logic;
        sel             : out    vl_logic_vector(7 downto 0)
    );
end project5;
