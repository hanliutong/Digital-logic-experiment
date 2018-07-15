library verilog;
use verilog.vl_types.all;
entity adder8_vlg_check_tst is
    port(
        cnt             : in     vl_logic_vector(2 downto 0);
        sampler_rx      : in     vl_logic
    );
end adder8_vlg_check_tst;
