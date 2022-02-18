--Fichier: InvAESRound_tb_conf.vhd
--Auteur: Patryk CHLANDA
--Projet: AES 128 en VHDL
-------
--Copyright 2021, Patryk Chlanda


library LIB_RTL;

configuration InvAESRound_tb_conf of InvAESRound_tb is
	for InvAESRound_tb_arch
		for DUT : InvAESRound
			use entity LIB_RTL.InvAESRound(InvAESRound_arch);
		end for;
	end for;
end InvAESRound_tb_conf;

