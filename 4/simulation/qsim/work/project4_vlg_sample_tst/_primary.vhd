library verilog;
use verilog.vl_types.all;
entity project4_vlg_sample_tst is
    port(
        A_in            : in     vl_logic_vector(3 downto 0);
        B_in            : in     vl_logic_vector(3 downto 0);
        s               : in     vl_logic_vector(1 downto 0);
        sampler_tx      : out    vl_logic
    );
end project4_vlg_sample_tst;
