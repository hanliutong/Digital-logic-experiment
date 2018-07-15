library verilog;
use verilog.vl_types.all;
entity keyboard_shake_vlg_sample_tst is
    port(
        SW_IN           : in     vl_logic;
        clk             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end keyboard_shake_vlg_sample_tst;
