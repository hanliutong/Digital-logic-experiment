library verilog;
use verilog.vl_types.all;
entity KS8_vlg_check_tst is
    port(
        SW_OUT          : in     vl_logic_vector(1 downto 0);
        sampler_rx      : in     vl_logic
    );
end KS8_vlg_check_tst;
