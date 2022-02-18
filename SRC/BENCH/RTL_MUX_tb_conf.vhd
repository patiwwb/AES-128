--Fichier: RTL_MUX_tb_conf.vhd
--Auteur: Patryk CHLANDA
--Projet: AES 128 en VHDL
-------
--Copyright 2021, Patryk Chlanda


library LIB_RTL;

configuration RTL_MUX_tb_conf of RTL_MUX_tb is

	for RTL_MUX_tb_arch
		for DUT:RTL_MUX
			use entity LIB_RTL.RTL_MUX(RTL_MUX_arch);
		end for;
	end for;
end configuration RTL_MUX_tb_conf;
