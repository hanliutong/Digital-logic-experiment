onerror {quit -f}
vlib work
vlog -work work project12.vo
vlog -work work project12.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.motor_12_vlg_vec_tst
vcd file -direction project12.msim.vcd
vcd add -internal motor_12_vlg_vec_tst/*
vcd add -internal motor_12_vlg_vec_tst/i1/*
add wave /*
run -all
