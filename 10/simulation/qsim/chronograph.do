onerror {quit -f}
vlib work
vlog -work work chronograph.vo
vlog -work work chronograph.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.register_bank_vlg_vec_tst
vcd file -direction chronograph.msim.vcd
vcd add -internal register_bank_vlg_vec_tst/*
vcd add -internal register_bank_vlg_vec_tst/i1/*
add wave /*
run -all
