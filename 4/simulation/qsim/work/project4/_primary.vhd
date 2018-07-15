library verilog;
use verilog.vl_types.all;
entity project4 is
    port(
        sel             : out    vl_logic;
        s               : in     vl_logic_vector(1 downto 0);
        A_in            : in     vl_logic_vector(3 downto 0);
        B_in            : in     vl_logic_vector(3 downto 0);
        c               : out    vl_logic;
        d               : out    vl_logic;
        e               : out    vl_logic;
        f               : out    vl_logic;
        g               : out    vl_logic;
        a               : out    vl_logic;
        b               : out    vl_logic;
        co              : out    vl_logic
    );
end project4;
