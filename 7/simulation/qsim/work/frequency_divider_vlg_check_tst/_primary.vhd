library verilog;
use verilog.vl_types.all;
entity frequency_divider_vlg_check_tst is
    port(
        clk_1Hz         : in     vl_logic;
        clk_1KHz        : in     vl_logic;
        clk_10Hz        : in     vl_logic;
        clk_100Hz       : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end frequency_divider_vlg_check_tst;
