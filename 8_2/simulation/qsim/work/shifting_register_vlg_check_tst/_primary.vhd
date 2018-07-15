library verilog;
use verilog.vl_types.all;
entity shifting_register_vlg_check_tst is
    port(
        Dout0           : in     vl_logic_vector(3 downto 0);
        Dout1           : in     vl_logic_vector(3 downto 0);
        Dout2           : in     vl_logic_vector(3 downto 0);
        Dout3           : in     vl_logic_vector(3 downto 0);
        Dout4           : in     vl_logic_vector(3 downto 0);
        Dout5           : in     vl_logic_vector(3 downto 0);
        Dout6           : in     vl_logic_vector(3 downto 0);
        Dout7           : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end shifting_register_vlg_check_tst;
