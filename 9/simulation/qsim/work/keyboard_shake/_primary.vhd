library verilog;
use verilog.vl_types.all;
entity keyboard_shake is
    port(
        clk             : in     vl_logic;
        SW_IN           : in     vl_logic;
        SW_OUT          : out    vl_logic
    );
end keyboard_shake;
