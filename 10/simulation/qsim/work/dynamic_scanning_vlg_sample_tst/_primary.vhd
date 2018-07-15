library verilog;
use verilog.vl_types.all;
entity dynamic_scanning_vlg_sample_tst is
    port(
        clk_DS          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end dynamic_scanning_vlg_sample_tst;
