--Fichier: AddRoundKey.vhd
--Auteur: Patryk CHLANDA
--Projet: AES 128 en VHDL
-------
--Copyright 2021, Patryk Chlanda


--imports
library ieee;
use ieee.std_logic_1164.all;
library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

--entity
entity AddRoundKey is
  port (
	state_i: in type_state; --signal état entrée
	round_k_i: in type_state; --signal round variant i
	state_o: out type_state ----signal état sortie
   
  );
end AddRoundKey;

--architecture
architecture AddRoundKey_arch of AddRoundKey is
begin --On fait byte par byte (on aurait pu faire colonne par colonne mais la fonction surchargée ne marchait pas)
  L1 : for i in 0 to 3 generate
    L2 : for j in 0 to 3 generate
      state_o(i)(j) <= round_k_i(i)(j) xor state_i(i)(j); --on utilise la fonction xor pour chaque case de la matrice 
    end generate;
  end generate;
end architecture;

