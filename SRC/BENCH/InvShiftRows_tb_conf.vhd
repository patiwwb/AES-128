--Fichier: InvShiftRows_tb_conf.vhd
--Auteur: Patryk CHLANDA
--Projet: AES 128 en VHDL
-------
--Copyright 2021, Patryk Chlanda

library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

configuration InvShiftRows_tb_conf of InvShiftRows_tb is
	for InvShiftRows_tb_arch
		for DUT : InvShiftRows
			use entity LIB_RTL.InvShiftRows(InvShiftRows_arch);
		end for;
	end for;
end InvShiftRows_tb_conf;
