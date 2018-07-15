library verilog;
use verilog.vl_types.all;
entity test is
    port(
        out_test        : out    vl_logic;
        \in\            : in     vl_logic;
        EN              : in     vl_logic
    );
end test;
