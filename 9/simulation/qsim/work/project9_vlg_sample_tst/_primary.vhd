library verilog;
use verilog.vl_types.all;
entity project9_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        F_in            : in     vl_logic_vector(7 downto 0);
        MODE            : in     vl_logic;
        SW0             : in     vl_logic;
        SW1             : in     vl_logic;
        SW2             : in     vl_logic;
        SW3             : in     vl_logic;
        SW4             : in     vl_logic;
        SW5             : in     vl_logic;
        SW6             : in     vl_logic;
        SW7             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end project9_vlg_sample_tst;
