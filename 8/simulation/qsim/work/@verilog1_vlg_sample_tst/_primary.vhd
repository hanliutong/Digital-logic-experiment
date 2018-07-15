library verilog;
use verilog.vl_types.all;
entity Verilog1_vlg_sample_tst is
    port(
        Clk             : in     vl_logic;
        F               : in     vl_logic;
        Mode            : in     vl_logic_vector(1 downto 0);
        sampler_tx      : out    vl_logic
    );
end Verilog1_vlg_sample_tst;
