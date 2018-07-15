onerror {quit -f}
vlib work
vlog -work work project9.vo
vlog -work work project9.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.check_38_vlg_vec_tst
vcd file -direction project9.msim.vcd
vcd add -internal check_38_vlg_vec_tst/*
vcd add -internal check_38_vlg_vec_tst/i1/*
add wave /*
run -all
