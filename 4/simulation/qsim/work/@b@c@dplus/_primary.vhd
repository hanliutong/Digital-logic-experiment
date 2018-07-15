library verilog;
use verilog.vl_types.all;
entity BCDplus is
    port(
        A               : in     vl_logic_vector(3 downto 0);
        B               : in     vl_logic_vector(3 downto 0);
        C               : out    vl_logic_vector(3 downto 0);
        co              : out    vl_logic
    );
end BCDplus;
