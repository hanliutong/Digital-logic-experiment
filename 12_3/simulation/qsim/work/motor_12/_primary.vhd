library verilog;
use verilog.vl_types.all;
entity motor_12 is
    port(
        t_floor         : in     vl_logic_vector(1 downto 0);
        clk_1KHz        : in     vl_logic;
        arrival         : in     vl_logic;
        c_floor         : out    vl_logic_vector(1 downto 0);
        lock            : out    vl_logic
    );
end motor_12;
