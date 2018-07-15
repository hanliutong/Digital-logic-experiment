library verilog;
use verilog.vl_types.all;
entity project9_vlg_sample_tst is
    port(
        clk_50MHz       : in     vl_logic;
        clr             : in     vl_logic;
        din             : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end project9_vlg_sample_tst;
