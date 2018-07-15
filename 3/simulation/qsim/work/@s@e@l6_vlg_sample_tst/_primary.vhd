library verilog;
use verilog.vl_types.all;
entity SEL6_vlg_sample_tst is
    port(
        EN              : in     vl_logic;
        in5             : in     vl_logic_vector(3 downto 0);
        in6             : in     vl_logic_vector(3 downto 0);
        sel             : in     vl_logic_vector(2 downto 0);
        sampler_tx      : out    vl_logic
    );
end SEL6_vlg_sample_tst;
