onerror {quit -f}
vlib work
vlog -work work project5.vo
vlog -work work project5.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.project5_vlg_vec_tst
vcd file -direction project5.msim.vcd
vcd add -internal project5_vlg_vec_tst/*
vcd add -internal project5_vlg_vec_tst/i1/*
add wave /*
run -all
