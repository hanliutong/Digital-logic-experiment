library verilog;
use verilog.vl_types.all;
entity project8 is
    port(
        ds1             : out    vl_logic;
        clk_50MHz       : in     vl_logic;
        rst             : in     vl_logic;
        ds2             : out    vl_logic;
        ds3             : out    vl_logic;
        ds4             : out    vl_logic;
        ds5             : out    vl_logic;
        ds6             : out    vl_logic;
        ds7             : out    vl_logic;
        ds8             : out    vl_logic;
        a               : out    vl_logic;
        Drc             : in     vl_logic;
        Data            : in     vl_logic_vector(7 downto 0);
        Mode            : in     vl_logic_vector(1 downto 0);
        Num             : in     vl_logic_vector(2 downto 0);
        b               : out    vl_logic;
        c               : out    vl_logic;
        d               : out    vl_logic;
        e               : out    vl_logic;
        f               : out    vl_logic;
        g               : out    vl_logic;
        Dout            : out    vl_logic_vector(7 downto 0)
    );
end project8;
