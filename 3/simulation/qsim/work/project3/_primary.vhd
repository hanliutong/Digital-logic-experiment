library verilog;
use verilog.vl_types.all;
entity project3 is
    port(
        a               : out    vl_logic;
        EN              : in     vl_logic;
        in5             : in     vl_logic_vector(3 downto 0);
        in6             : in     vl_logic_vector(3 downto 0);
        sel             : in     vl_logic_vector(2 downto 0);
        b               : out    vl_logic;
        c               : out    vl_logic;
        d               : out    vl_logic;
        e               : out    vl_logic;
        f               : out    vl_logic;
        g               : out    vl_logic;
        LED_sel         : out    vl_logic
    );
end project3;
