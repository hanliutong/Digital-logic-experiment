library verilog;
use verilog.vl_types.all;
entity frequency_divider is
    port(
        clk_50MHz       : in     vl_logic;
        rst             : in     vl_logic;
        clk_1KHz        : out    vl_logic;
        clk_100Hz       : out    vl_logic;
        clk_10Hz        : out    vl_logic;
        clk_1Hz         : out    vl_logic
    );
end frequency_divider;
