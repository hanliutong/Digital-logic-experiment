library verilog;
use verilog.vl_types.all;
entity state_vlg_check_tst is
    port(
        drc             : in     vl_logic_vector(1 downto 0);
        t_floor         : in     vl_logic_vector(1 downto 0);
        sampler_rx      : in     vl_logic
    );
end state_vlg_check_tst;
