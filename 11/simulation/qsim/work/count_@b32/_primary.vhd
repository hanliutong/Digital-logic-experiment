library verilog;
use verilog.vl_types.all;
entity count_B32 is
    port(
        F               : in     vl_logic;
        Din             : in     vl_logic_vector(3 downto 0);
        cnt             : out    vl_logic_vector(3 downto 0)
    );
end count_B32;
