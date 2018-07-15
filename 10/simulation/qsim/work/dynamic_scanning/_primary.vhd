library verilog;
use verilog.vl_types.all;
entity dynamic_scanning is
    port(
        ds1             : out    vl_logic;
        clk_DS          : in     vl_logic;
        ds2             : out    vl_logic;
        ds3             : out    vl_logic;
        ds4             : out    vl_logic;
        ds5             : out    vl_logic;
        ds6             : out    vl_logic;
        ds7             : out    vl_logic;
        ds8             : out    vl_logic;
        sel_DS          : out    vl_logic_vector(2 downto 0)
    );
end dynamic_scanning;
