--Fichier: FSM_InvAES_tb_conf.vhd
--Auteur: Patryk CHLANDA
--Projet: AES 128 en VHDL
-------
--Copyright 2021, Patryk Chlanda

library LIB_RTL;

configuration FSM_InvAES_tb_conf of FSM_InvAES_tb is
	for FSM_InvAES_tb_arch
		for DUT : FSM_InvAES
			use entity LIB_RTL.FSM_InvAES(FSM_InvAES_arch_Moore);
		end for;
	end for;
end FSM_InvAES_tb_conf;
