library verilog;
use verilog.vl_types.all;
entity count_B32_vlg_sample_tst is
    port(
        Din             : in     vl_logic_vector(3 downto 0);
        F               : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end count_B32_vlg_sample_tst;
