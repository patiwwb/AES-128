--Fichier: AddRoundKey_tb_conf.vhd
--Auteur: Patryk CHLANDA
--Projet: AES 128 en VHDL
-------
--Copyright 2021, Patryk Chlanda

library LIB_RTL;

configuration AddRoundKey_tb_conf of AddRoundKey_tb is
  for AddRoundKey_tb_arch
    for DUT: AddRoundKey
      use entity LIB_RTL.AddRoundKey(AddRoundKey_arch);
    end for;
  end for;
end configuration AddRoundKey_tb_conf;
