library verilog;
use verilog.vl_types.all;
entity register8_vlg_check_tst is
    port(
        Dout            : in     vl_logic_vector(7 downto 0);
        ZERO            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end register8_vlg_check_tst;
