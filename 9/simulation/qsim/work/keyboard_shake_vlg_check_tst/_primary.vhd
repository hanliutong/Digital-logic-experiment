library verilog;
use verilog.vl_types.all;
entity keyboard_shake_vlg_check_tst is
    port(
        SW_OUT          : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end keyboard_shake_vlg_check_tst;
