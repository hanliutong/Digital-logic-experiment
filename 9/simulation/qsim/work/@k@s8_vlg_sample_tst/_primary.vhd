library verilog;
use verilog.vl_types.all;
entity KS8_vlg_sample_tst is
    port(
        SW_IN           : in     vl_logic_vector(1 downto 0);
        clk             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end KS8_vlg_sample_tst;
