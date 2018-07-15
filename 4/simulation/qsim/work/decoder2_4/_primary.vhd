library verilog;
use verilog.vl_types.all;
entity decoder2_4 is
    port(
        s               : in     vl_logic_vector(1 downto 0);
        out1            : out    vl_logic;
        out2            : out    vl_logic;
        out3            : out    vl_logic;
        out4            : out    vl_logic
    );
end decoder2_4;
