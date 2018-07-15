library verilog;
use verilog.vl_types.all;
entity floor is
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
        drc             : in     vl_logic_vector(1 downto 0);
        Fout_1up        : out    vl_logic;
        Fout_2up        : out    vl_logic;
        Fout_3up        : out    vl_logic;
        Fout_2dn        : out    vl_logic;
        Fout_3dn        : out    vl_logic;
        Fout_4dn        : out    vl_logic;
        Fout_1          : out    vl_logic;
        Fout_2          : out    vl_logic;
        Fout_3          : out    vl_logic;
        Fout_4          : out    vl_logic;
        arrival         : out    vl_logic;
        door            : out    vl_logic;
        lock            : in     vl_logic;
        err             : in     vl_logic;
        full            : in     vl_logic
    );
end floor;
