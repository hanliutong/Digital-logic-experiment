library verilog;
use verilog.vl_types.all;
entity shifting_register_vlg_sample_tst is
    port(
        Clk             : in     vl_logic;
        Data            : in     vl_logic_vector(3 downto 0);
        F               : in     vl_logic;
        Mode            : in     vl_logic_vector(1 downto 0);
        sampler_tx      : out    vl_logic
    );
end shifting_register_vlg_sample_tst;
