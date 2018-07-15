library verilog;
use verilog.vl_types.all;
entity adder8 is
    port(
        in1             : in     vl_logic;
        in2             : in     vl_logic;
        in3             : in     vl_logic;
        in4             : in     vl_logic;
        in5             : in     vl_logic;
        in6             : in     vl_logic;
        in7             : in     vl_logic;
        in8             : in     vl_logic;
        cnt             : out    vl_logic_vector(2 downto 0);
        Aen             : in     vl_logic;
        clk             : in     vl_logic
    );
end adder8;
