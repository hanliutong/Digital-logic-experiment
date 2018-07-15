library verilog;
use verilog.vl_types.all;
entity kbd is
    port(
        clk             : in     vl_logic;
        SWC             : in     vl_logic_vector(3 downto 0);
        SWR0            : out    vl_logic;
        SWR1            : out    vl_logic;
        SWR2            : out    vl_logic;
        SWR3            : out    vl_logic;
        key             : out    vl_logic_vector(15 downto 0);
        key_E_4B        : out    vl_logic_vector(3 downto 0);
        F               : out    vl_logic
    );
end kbd;
