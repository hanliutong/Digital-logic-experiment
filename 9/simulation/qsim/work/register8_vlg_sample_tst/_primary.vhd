library verilog;
use verilog.vl_types.all;
entity register8_vlg_sample_tst is
    port(
        CP              : in     vl_logic;
        Din             : in     vl_logic_vector(7 downto 0);
        F               : in     vl_logic;
        MODE            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end register8_vlg_sample_tst;
