library verilog;
use verilog.vl_types.all;
entity \38Counter\ is
    port(
        RCC             : out    vl_logic;
        CLK             : in     vl_logic;
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end \38Counter\;
