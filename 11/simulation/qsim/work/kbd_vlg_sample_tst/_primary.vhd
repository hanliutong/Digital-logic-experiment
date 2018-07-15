library verilog;
use verilog.vl_types.all;
entity kbd_vlg_sample_tst is
    port(
        SWC             : in     vl_logic_vector(3 downto 0);
        clk             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end kbd_vlg_sample_tst;
