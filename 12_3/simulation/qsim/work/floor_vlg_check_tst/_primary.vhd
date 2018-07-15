library verilog;
use verilog.vl_types.all;
entity floor_vlg_check_tst is
    port(
        Fout_1          : in     vl_logic;
        Fout_1up        : in     vl_logic;
        Fout_2          : in     vl_logic;
        Fout_2dn        : in     vl_logic;
        Fout_2up        : in     vl_logic;
        Fout_3          : in     vl_logic;
        Fout_3dn        : in     vl_logic;
        Fout_3up        : in     vl_logic;
        Fout_4          : in     vl_logic;
        Fout_4dn        : in     vl_logic;
        arrival         : in     vl_logic;
        door            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end floor_vlg_check_tst;
