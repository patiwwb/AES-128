echo "Début script de compilation"

echo "Suppression des lib"
vdel -lib LIB/LIB_RTL -all
vdel -lib LIB/LIB_BENCH -all
vdel -lib LIB/LIB_AES -all

echo "Création des répertoires"
vlib LIB/LIB_RTL
vlib LIB/LIB_BENCH
vlib LIB/LIB_AES

vmap LIB_RTL LIB/LIB_RTL
vmap LIB_BENCH LIB/LIB_BENCH
vmap LIB_AES LIB/LIB_AES

echo "Compilation des fichiers fournis"
vcom +acc -work LIB_AES SRC/PACKAGE/state_definition_package.vhd

echo "Compilation du package personnalisé"
vcom +acc -work LIB_AES SRC/PACKAGE/convertion_function_package.vhd


echo "Compilation des fichiers sources"
vcom +acc -work LIB_RTL SRC/RTL/InvSbox.vhd

vcom +acc -work LIB_RTL SRC/RTL/InvSubBytes.vhd

vcom +acc -work LIB_RTL SRC/RTL/InvShiftRows.vhd

vcom +acc -work LIB_RTL SRC/RTL/AddRoundKey.vhd

vcom +acc -work LIB_RTL SRC/RTL/MatrixMultiplier.vhd

vcom +acc -work LIB_RTL SRC/RTL/InvMixColumns.vhd

vcom +acc -work LIB_RTL SRC/RTL/InvAESRound.vhd

vcom +acc -work LIB_RTL SRC/RTL/FSM_InvAES.vhd

vcom +acc -work LIB_RTL SRC/RTL/RTL_MUX.vhd

vcom +acc -work LIB_RTL SRC/RTL/RTL_REG.vhd

vcom +acc -work LIB_RTL SRC/RTL/Counter.vhd

vcom +acc -work LIB_RTL SRC/RTL/KeyExpansion_table.vhd

vcom +acc -work LIB_RTL SRC/RTL/InvAES.vhd

echo "Compilation des fichiers test bench" 
vcom -work LIB_BENCH SRC/BENCH/InvSbox_tb.vhd
vcom -work LIB_BENCH SRC/BENCH/InvSubBytes_tb.vhd
vcom -work LIB_BENCH SRC/BENCH/InvShiftRows_tb.vhd
vcom -work LIB_BENCH SRC/BENCH/AddRoundKey_tb.vhd
vcom -work LIB_BENCH SRC/BENCH/MatrixMultiplier_tb.vhd
vcom -work LIB_BENCH SRC/BENCH/InvMixColumns_tb.vhd
vcom -work LIB_BENCH SRC/BENCH/InvAESRound_tb.vhd
vcom -work LIB_BENCH SRC/BENCH/FSM_InvAES_tb.vhd
vcom -work LIB_BENCH SRC/BENCH/RTL_MUX_tb.vhd
vcom -work LIB_BENCH SRC/BENCH/RTL_REG_tb.vhd
vcom -work LIB_BENCH SRC/BENCH/Counter_tb.vhd
vcom -work LIB_BENCH SRC/BENCH/KeyExpansion_table_tb.vhd
vcom +acc -work LIB_BENCH SRC/BENCH/FSM_InvAES_tb.vhd
vcom +acc -work LIB_BENCH SRC/BENCH/InvAESRound_tb.vhd
vcom +acc -work LIB_BENCH SRC/BENCH/InvAES_tb.vhd


echo "Compilation des fichiers test bench conf"
vcom -work LIB_BENCH SRC/BENCH/InvSbox_tb_conf.vhd
vcom -work LIB_BENCH SRC/BENCH/InvSubBytes_tb_conf.vhd
vcom -work LIB_BENCH SRC/BENCH/InvShiftRows_tb_conf.vhd
vcom -work LIB_BENCH SRC/BENCH/AddRoundKey_tb_conf.vhd
vcom -work LIB_BENCH SRC/BENCH/MatrixMultiplier_tb_conf.vhd
vcom -work LIB_BENCH SRC/BENCH/InvMixColumns_tb_conf.vhd
vcom -work LIB_BENCH SRC/BENCH/InvAESRound_tb_conf.vhd
vcom -work LIB_BENCH SRC/BENCH/FSM_InvAES_tb_conf.vhd
vcom -work LIB_BENCH SRC/BENCH/RTL_MUX_tb_conf.vhd
vcom -work LIB_BENCH SRC/BENCH/RTL_REG_tb_conf.vhd
vcom -work LIB_BENCH SRC/BENCH/Counter_tb_conf.vhd
#vcom -work LIB_BENCH SRC/BENCH/KeyExpansion_table_tb.vhd
vcom +acc -work LIB_BENCH SRC/BENCH/FSM_InvAES_tb_conf.vhd
vcom +acc -work LIB_BENCH SRC/BENCH/InvAESRound_tb_conf.vhd
vcom +acc -work LIB_BENCH SRC/BENCH/InvAES_tb_conf.vhd


echo "Compilation finie"


echo "Lancement de la simulation"

#vsim &
#vsim LIB_BENCH.InvSbox_tb_conf &
#vsim LIB_BENCH.InvSubBytes_tb_conf &
#vsim LIB_BENCH.AddRoundKey_tb_conf &
#vsim LIB_BENCH.InvShiftRows_tb_conf &
#vsim LIB_BENCH.MatrixMultiplier_tb_conf &
#vsim LIB_BENCH.InvMixColumns_tb_conf &
#vsim LIB_BENCH.Counter_tb_conf &
#vsim LIB_BENCH.RTL_MUX_tb_conf &
#vsim LIB_BENCH.RTL_REG_tb_conf &
#vsim LIB_BENCH.KeyExpansion_table_tb &
#vsim LIB_BENCH.InvAESRound_tb &
#vsim LIB_BENCH.FSM_InvAES_tb &
vsim LIB_BENCH.InvAES_tb &

