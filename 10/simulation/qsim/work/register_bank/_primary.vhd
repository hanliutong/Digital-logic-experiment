library verilog;
use verilog.vl_types.all;
entity register_bank is
    port(
        Dout            : out    vl_logic_vector(23 downto 0);
        \1KHz\          : in     vl_logic;
        F1_in           : in     vl_logic;
        CLRN            : in     vl_logic;
        SW1             : in     vl_logic;
        min             : in     vl_logic_vector(7 downto 0);
        ms              : in     vl_logic_vector(7 downto 0);
        s               : in     vl_logic_vector(7 downto 0);
        Z               : out    vl_logic_vector(8 downto 1)
    );
end register_bank;
