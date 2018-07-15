library verilog;
use verilog.vl_types.all;
entity decoder2_4_vlg_sample_tst is
    port(
        s               : in     vl_logic_vector(1 downto 0);
        sampler_tx      : out    vl_logic
    );
end decoder2_4_vlg_sample_tst;
