library verilog;
use verilog.vl_types.all;
entity state is
    port(
        Fin_1up         : in     vl_logic;
        Fin_2up         : in     vl_logic;
        Fin_3up         : in     vl_logic;
        Fin_2dn         : in     vl_logic;
        Fin_3dn         : in     vl_logic;
        Fin_4dn         : in     vl_logic;
        Fin_1           : in     vl_logic;
        Fin_2           : in     vl_logic;
        Fin_3           : in     vl_logic;
        Fin_4           : in     vl_logic;
        clk_1KHz        : in     vl_logic;
        c_floor         : in     vl_logic_vector(1 downto 0);
        drc             : out    vl_logic_vector(1 downto 0);
        t_floor         : out    vl_logic_vector(1 downto 0);
        full            : in     vl_logic;
        arrival         : in     vl_logic
    );
end state;
