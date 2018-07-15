library verilog;
use verilog.vl_types.all;
entity motor_12_vlg_check_tst is
    port(
        c_floor         : in     vl_logic_vector(1 downto 0);
        lock            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end motor_12_vlg_check_tst;
