library verilog;
use verilog.vl_types.all;
entity register8 is
    port(
        CP              : in     vl_logic;
        F               : in     vl_logic;
        MODE            : in     vl_logic;
        Din             : in     vl_logic_vector(7 downto 0);
        Dout            : out    vl_logic_vector(7 downto 0);
        ZERO            : out    vl_logic
    );
end register8;
