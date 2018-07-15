library verilog;
use verilog.vl_types.all;
entity dynamic_scanning_vlg_check_tst is
    port(
        ds1             : in     vl_logic;
        ds2             : in     vl_logic;
        ds3             : in     vl_logic;
        ds4             : in     vl_logic;
        ds5             : in     vl_logic;
        ds6             : in     vl_logic;
        ds7             : in     vl_logic;
        ds8             : in     vl_logic;
        sel_DS          : in     vl_logic_vector(2 downto 0);
        sampler_rx      : in     vl_logic
    );
end dynamic_scanning_vlg_check_tst;
