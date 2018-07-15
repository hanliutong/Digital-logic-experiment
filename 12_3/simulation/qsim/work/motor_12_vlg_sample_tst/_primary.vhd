library verilog;
use verilog.vl_types.all;
entity motor_12_vlg_sample_tst is
    port(
        arrival         : in     vl_logic;
        clk_1KHz        : in     vl_logic;
        t_floor         : in     vl_logic_vector(1 downto 0);
        sampler_tx      : out    vl_logic
    );
end motor_12_vlg_sample_tst;
