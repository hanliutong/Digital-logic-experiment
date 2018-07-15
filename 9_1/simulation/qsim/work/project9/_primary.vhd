library verilog;
use verilog.vl_types.all;
entity project9 is
    port(
        F               : out    vl_logic;
        clk_50MHz       : in     vl_logic;
        clr             : in     vl_logic;
        din             : in     vl_logic_vector(7 downto 0);
        led_sel         : out    vl_logic;
        a               : out    vl_logic;
        b               : out    vl_logic;
        d               : out    vl_logic;
        e               : out    vl_logic;
        g               : out    vl_logic;
        c               : out    vl_logic;
        f_led           : out    vl_logic;
        pin_name1       : out    vl_logic
    );
end project9;
