library verilog;
use verilog.vl_types.all;
entity project8_vlg_sample_tst is
    port(
        Data            : in     vl_logic_vector(3 downto 0);
        Mode            : in     vl_logic_vector(1 downto 0);
        rst             : in     vl_logic;
        T1              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end project8_vlg_sample_tst;
