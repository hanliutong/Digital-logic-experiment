library verilog;
use verilog.vl_types.all;
entity project9 is
    port(
        A               : out    vl_logic;
        MODE            : in     vl_logic;
        CLK             : in     vl_logic;
        F_in            : in     vl_logic_vector(7 downto 0);
        SW7             : in     vl_logic;
        SW6             : in     vl_logic;
        SW5             : in     vl_logic;
        SW4             : in     vl_logic;
        SW3             : in     vl_logic;
        SW2             : in     vl_logic;
        SW1             : in     vl_logic;
        SW0             : in     vl_logic;
        B               : out    vl_logic;
        C               : out    vl_logic;
        D               : out    vl_logic;
        E               : out    vl_logic;
        F               : out    vl_logic;
        G               : out    vl_logic;
        DS1             : out    vl_logic;
        DS2             : out    vl_logic;
        DS3             : out    vl_logic;
        DS4             : out    vl_logic;
        DS5             : out    vl_logic;
        DS6             : out    vl_logic;
        DS7             : out    vl_logic;
        DS8             : out    vl_logic
    );
end project9;
