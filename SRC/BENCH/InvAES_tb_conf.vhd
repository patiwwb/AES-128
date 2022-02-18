--Fichier: InvAES_tb_conf.vhd
--Auteur: Patryk CHLANDA
--Projet: AES 128 en VHDL
-------
--Copyright 2021, Patryk Chlanda


library LIB_RTL;

configuration InvAES_tb_conf of InvAES_tb is
	for InvAES_tb_arch
		for DUT : InvAES
			use configuration LIB_RTL.InvAES_conf;
		end for;
	end for;
end InvAES_tb_conf;
