--Fichier: InvSubBytes.vhd
--Auteur: Patryk CHLANDA
--Projet: AES 128 en VHDL
-------
--Copyright 2021, Patryk Chlanda


library ieee;
use ieee.std_logic_1164.all;
library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

--entity
entity InvSubBytes is

  port (
    state_i: in type_state;
    state_o: out type_state
  );

end entity InvSubBytes;

--architecture 
architecture InvSubBytes_arch of InvSubBytes is

  component InvSbox
    port (
      data_i: in bit8; --octet
      data_o: out bit8
    );
  end component;

	begin
	--fill a 4x4 matrix (type_state) better than using modulos
	  L1: for i in 0 to 3 generate
		L2: for j in 0 to 3 generate
		  Sbox : InvSbox port map(
		    data_i => state_i(i)(j),
		    data_o => state_o(i)(j)
		  );
		end generate;
	  end generate;
	  --Gen_sBox : for i in 0 to 15 generate 
	  --Sbox : InvSbox port map ( 
			--correspondance des inputs
				--data_i => state_i(i/4)(i mod 4),
				    --data_o => state_o(i/4)(i mod 4)
		--);
	  --end generate;

end architecture InvSubBytes_arch;

-- We can also put in a separate file

configuration InvSubBytes_conf of InvSubBytes is
  for InvSubBytes_arch
    for L1
      for L2
        for all: InvSbox
          use entity LIB_RTL.InvSbox(InvSbox_arch);
        end for;
      end for;
    end for;
  end for;
end configuration InvSubBytes_conf;
