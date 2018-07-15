library verilog;
use verilog.vl_types.all;
entity project5_vlg_sample_tst is
    port(
        SW              : in     vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end project5_vlg_sample_tst;
