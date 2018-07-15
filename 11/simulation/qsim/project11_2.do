onerror {quit -f}
vlib work
vlog -work work project11_2.vo
vlog -work work project11_2.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.count_B32_vlg_vec_tst
vcd file -direction project11_2.msim.vcd
vcd add -internal count_B32_vlg_vec_tst/*
vcd add -internal count_B32_vlg_vec_tst/i1/*
add wave /*
run -all
