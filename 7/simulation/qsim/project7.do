onerror {quit -f}
vlib work
vlog -work work project7.vo
vlog -work work project7.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.frequency_divider_vlg_vec_tst
vcd file -direction project7.msim.vcd
vcd add -internal frequency_divider_vlg_vec_tst/*
vcd add -internal frequency_divider_vlg_vec_tst/i1/*
add wave /*
run -all
