library verilog;
use verilog.vl_types.all;
entity project8_vlg_sample_tst is
    port(
        clk_50MHz       : in     vl_logic;
        Data            : in     vl_logic_vector(7 downto 0);
        Drc             : in     vl_logic;
        Mode            : in     vl_logic_vector(1 downto 0);
        Num             : in     vl_logic_vector(2 downto 0);
        rst             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end project8_vlg_sample_tst;
