library verilog;
use verilog.vl_types.all;
entity Verilog1 is
    port(
        Clk             : in     vl_logic;
        F               : in     vl_logic;
        Mode            : in     vl_logic_vector(1 downto 0);
        F_C             : out    vl_logic
    );
end Verilog1;
