library verilog;
use verilog.vl_types.all;
entity adder8_vlg_sample_tst is
    port(
        Aen             : in     vl_logic;
        clk             : in     vl_logic;
        in1             : in     vl_logic;
        in2             : in     vl_logic;
        in3             : in     vl_logic;
        in4             : in     vl_logic;
        in5             : in     vl_logic;
        in6             : in     vl_logic;
        in7             : in     vl_logic;
        in8             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end adder8_vlg_sample_tst;
