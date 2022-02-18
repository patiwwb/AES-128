--Fichier: RTL_REG_tb_conf.vhd
--Auteur: Patryk CHLANDA
--Projet: AES 128 en VHDL
-------
--Copyright 2021, Patryk Chlanda


library LIB_RTL;

configuration RTL_REG_tb_conf of RTL_REG_tb is
	for RTL_REG_tb_arch
		for DUT : RTL_REG
			use entity LIB_RTL.RTL_REG(RTL_REG_arch);
		end for;
	end for;
end RTL_REG_tb_conf;
