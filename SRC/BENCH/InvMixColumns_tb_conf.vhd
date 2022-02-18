--Fichier: InvMixColumns_conf.vhd
--Auteur: Patryk CHLANDA
--Projet: AES 128 en VHDL
-------
--Copyright 2021, Patryk Chlanda


library LIB_RTL;

configuration InvMixColumns_tb_conf of InvMixColumns_tb is
  for InvMixColumns_tb_arch
    for DUT: InvMixColumns
      use configuration LIB_RTL.InvMixColumns_conf;
    end for;
  end for;
end configuration InvMixColumns_tb_conf;
