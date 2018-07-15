library verilog;
use verilog.vl_types.all;
entity floor_vlg_sample_tst is
    port(
        Fin_1           : in     vl_logic;
        Fin_1up         : in     vl_logic;
        Fin_2           : in     vl_logic;
        Fin_2dn         : in     vl_logic;
        Fin_2up         : in     vl_logic;
        Fin_3           : in     vl_logic;
        Fin_3dn         : in     vl_logic;
        Fin_3up         : in     vl_logic;
        Fin_4           : in     vl_logic;
        Fin_4dn         : in     vl_logic;
        c_floor         : in     vl_logic_vector(1 downto 0);
        clk_1KHz        : in     vl_logic;
        drc             : in     vl_logic_vector(1 downto 0);
        err             : in     vl_logic;
        full            : in     vl_logic;
        lock            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end floor_vlg_sample_tst;
