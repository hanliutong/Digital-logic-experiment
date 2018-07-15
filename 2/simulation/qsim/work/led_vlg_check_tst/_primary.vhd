library verilog;
use verilog.vl_types.all;
entity led_vlg_check_tst is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        c               : in     vl_logic;
        d               : in     vl_logic;
        e               : in     vl_logic;
        f               : in     vl_logic;
        g               : in     vl_logic;
        sel             : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end led_vlg_check_tst;
