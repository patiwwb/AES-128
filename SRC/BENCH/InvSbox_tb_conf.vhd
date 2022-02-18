--Fichier: InvSbox_tb_conf.vhd
--Auteur: Patryk CHLANDA
--Projet: AES 128 en VHDL
-------
--Copyright 2021, Patryk Chlanda


library LIB_RTL;

configuration InvSbox_tb_conf of InvSbox_tb is
  for InvSbox_tb_arch
    for DUT: InvSbox
      use entity LIB_RTL.InvSbox(InvSbox_arch);
    end for;
  end for;
end configuration InvSbox_tb_conf;
