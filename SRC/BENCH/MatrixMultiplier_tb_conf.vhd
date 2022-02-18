--Fichier: MatrixMultiplier_tb_conf.vhd
--Auteur: Patryk CHLANDA
--Projet: AES 128 en VHDL
-------
--Copyright 2021, Patryk Chlanda


library ieee;
use ieee.std_logic_1164.all;
library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

configuration MatrixMultiplier_tb_conf of MatrixMultiplier_tb is
	for MatrixMultiplier_tb_arch
		for DUT : MatrixMultiplier
			use entity LIB_RTL.MatrixMultiplier(MatrixMultiplier_arch);
		end for;
	end for;
end MatrixMultiplier_tb_conf;
