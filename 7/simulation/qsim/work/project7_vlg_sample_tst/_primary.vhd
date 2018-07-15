library verilog;
use verilog.vl_types.all;
entity project7_vlg_sample_tst is
    port(
        SW              : in     vl_logic;
        clk_50MHz       : in     vl_logic;
        reset           : in     vl_logic;
        rst             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end project7_vlg_sample_tst;
