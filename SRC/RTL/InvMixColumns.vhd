--Fichier: InvMixColumns.vhd
--Auteur: Patryk CHLANDA
--Projet: AES 128 en VHDL
-------
--Copyright 2021, Patryk Chlanda


library ieee;
use ieee.std_logic_1164.all;
library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

entity InvMixColumns is
  port (
    state_i : in type_state;
    state_o : out type_state);

end entity InvMixColumns;

architecture InvMixColumns_arch of InvMixColumns is
  -- on va faire les multiplications avec MatrixMultiplier 
  component MatrixMultiplier
    port (
      data_i : in column_state;
      data_o : out column_state
    );
  end component;

begin
--attribution des états morceau par morceau
  Generate1 : for i in 0 to 3 generate
  M_Multiplier : MatrixMultiplier
    port map(
      data_i(0) => state_i(0)(i),
      data_i(1) => state_i(1)(i),
      data_i(2) => state_i(2)(i),
      data_i(3) => state_i(3)(i),
      data_o(0) => state_o(0)(i),
      data_o(1) => state_o(1)(i),
      data_o(2) => state_o(2)(i),
      data_o(3) => state_o(3)(i)
    );
  end generate;

end architecture;

-- We can also put in a separate file instead
configuration InvMixColumns_conf of InvMixColumns is
  for InvMixColumns_arch
    for Generate1
      for all : MatrixMultiplier
        use entity LIB_RTL.MatrixMultiplier(MatrixMultiplier_arch);
      end for;
    end for;
  end for;
end configuration InvMixColumns_conf;
