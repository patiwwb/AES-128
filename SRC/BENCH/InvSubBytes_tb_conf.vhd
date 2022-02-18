--Fichier: InvSubBytes_tb_conf.vhd
--Auteur: Patryk CHLANDA
--Projet: AES 128 en VHDL
-------
--Copyright 2021, Patryk Chlanda


library LIB_RTL;

configuration InvSubBytes_tb_conf of InvSubBytes_tb is
  for InvSubBytes_tb_arch
    for DUT: InvSubBytes
      use configuration LIB_RTL.InvSubBytes_conf;
    end for;
  end for;
end configuration InvSubBytes_tb_conf;
