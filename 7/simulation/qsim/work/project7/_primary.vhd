library verilog;
use verilog.vl_types.all;
entity project7 is
    port(
        clk_50MHz       : in     vl_logic;
        rst             : in     vl_logic;
        SW              : in     vl_logic;
        reset           : in     vl_logic;
        clk_1KHz        : out    vl_logic;
        clk_100Hz       : out    vl_logic;
        clk_10Hz        : out    vl_logic;
        sel             : out    vl_logic_vector(7 downto 0)
    );
end project7;
