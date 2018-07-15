library verilog;
use verilog.vl_types.all;
entity kbd_vlg_check_tst is
    port(
        F               : in     vl_logic;
        SWR0            : in     vl_logic;
        SWR1            : in     vl_logic;
        SWR2            : in     vl_logic;
        SWR3            : in     vl_logic;
        key             : in     vl_logic_vector(15 downto 0);
        key_E_4B        : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end kbd_vlg_check_tst;
