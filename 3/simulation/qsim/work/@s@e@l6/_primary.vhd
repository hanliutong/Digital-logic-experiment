library verilog;
use verilog.vl_types.all;
entity SEL6 is
    port(
        in5             : in     vl_logic_vector(3 downto 0);
        in6             : in     vl_logic_vector(3 downto 0);
        sel             : in     vl_logic_vector(2 downto 0);
        EN              : in     vl_logic;
        \out\           : out    vl_logic_vector(3 downto 0)
    );
end SEL6;
