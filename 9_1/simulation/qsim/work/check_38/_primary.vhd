library verilog;
use verilog.vl_types.all;
entity check_38 is
    port(
        clk             : in     vl_logic;
        din             : in     vl_logic;
        F               : out    vl_logic;
        state           : out    vl_logic_vector(3 downto 0)
    );
end check_38;
