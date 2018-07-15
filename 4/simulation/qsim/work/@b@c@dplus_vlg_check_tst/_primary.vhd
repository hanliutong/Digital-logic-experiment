library verilog;
use verilog.vl_types.all;
entity BCDplus_vlg_check_tst is
    port(
        C               : in     vl_logic_vector(3 downto 0);
        co              : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end BCDplus_vlg_check_tst;
