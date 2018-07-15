library verilog;
use verilog.vl_types.all;
entity project7_vlg_check_tst is
    port(
        clk_1KHz        : in     vl_logic;
        clk_10Hz        : in     vl_logic;
        clk_100Hz       : in     vl_logic;
        sel             : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end project7_vlg_check_tst;
