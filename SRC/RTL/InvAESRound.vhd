--Fichier: InvAESRound.vhd
--Auteur: Patryk CHLANDA
--Projet: AES 128 en VHDL
-------
--Copyright 2021, Patryk Chlanda


library ieee;
use ieee.std_logic_1164.all;
library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

entity InvAESround is

  port (
    currentkey_i: in bit128;
    currenttext_i: in bit128;
	clock_i: in std_logic;
	enableRoundcomputing_i: in std_logic;
    enableInvMixcolumns_i: in std_logic;
    resetb_i: in std_logic;
    data_o: out bit128
  );

end entity InvAESround;

architecture InvAESround_arch of InvAESround is

--composant du InvSubsyte
  component InvSubBytes is
    port (
      state_i: in type_state;
      state_o: out type_state
    );
  end component InvSubBytes;

--composants du melange des colomnes
  component InvShiftRows is
    port (
	  state_o: out type_state;
      state_i: in type_state
    );
  end component InvShiftRows;

  component InvMixColumns is
    port (
      state_i: in type_state;
      state_o: out type_state
    );
  end component InvMixColumns;
  
  component AddRoundKey is
    port (
      state_i: in type_state;
      round_k_i: in type_state;
      state_o: out type_state
    );
  end component AddRoundKey;

 -- déclarons
  signal state_s, add_output_s, add_input_s, sub_output_s, shift_output_s, mix_output_s, currentkey_s, currenttext_s, round_output_s : type_state;


begin

-- j'utilise pas ma fonction de conversion bit128 <-> type_state car ça n'a pas de "réel" correspondance hardware
  label1:for i in 0 to 3 generate
		label2:for j in 0 to 3 generate-- on rempli chaque byte avec deux boucles
			currentkey_s(i)(j) <= currentkey_i((127-8*(4*j+i)) downto (120-8*(4*j+i)));
			currenttext_s(i)(j) <= currenttext_i((127-8*(4*j+i)) downto (120-8*(4*j+i)));
		end generate;
	end generate;

add_input_s <= currenttext_s when enableRoundcomputing_i = '0' else sub_output_s ;

round_output_s <= add_output_s when enableInvMixcolumns_i = '0' else mix_output_s;


	--code fournis dans la slide du cours 
	seq_0 : process (clock_i, resetb_i) is
	begin -- process seq_0
	if resetb_i = '0' then -- asynchronous reset (active-low)
	state_s <= ((others => (others => (others => '0'))));
	-- or use 2 x for ... generate
	elsif clock_i'event and clock_i = '1' then -- rising clock
	state_s <= round_output_s;
	end if;
	end process seq_0;

  SB : InvSubBytes
    port map(
      state_i => shift_output_s,
      state_o => sub_output_s 
    );

  SR: InvShiftRows
    port map(
      state_i => currenttext_s, 
      state_o => shift_output_s
    );

  MC: InvMixColumns
    port map(
      state_i => add_output_s,
      state_o => mix_output_s
    );
	
  ARK: AddRoundKey
    port map(
      state_i => add_input_s,
      round_k_i => currentkey_s,
      state_o => add_output_s
    );

-- j'utilise pas ma fonction de conversion bit128 <-> type_state car ça n'a pas de "réel" correspondance hardware
label3:for i in 0 to 3 generate -- on rempli chaque byte avec deux boucles
		label4:for j in 0 to 3 generate
			data_o((127 - (4*j + i)*8) downto (127 - ((4*j + i)*8 + 7))) <= state_s(i)(j); 
		end generate;
	end generate;

end architecture InvAESRound_arch;

configuration InvAESRound_conf of InvAESRound is
    for InvAESRound_arch
        for all : AddRoundKey
            use entity LIB_RTL.AddRoundKey(AddRoundKey_arch);
        end for;
        for all : InvSubBytes
            use configuration LIB_RTL.InvSubBytes_conf;
        end for;
        for all : InvShiftRows
            use entity LIB_RTL.InvShiftRows(InvShiftRows_arch);
        end for;
        for all : InvMixColumns
            use configuration LIB_RTL.InvMixColumns_conf;
        end for;
    end for;
end configuration InvAESRound_conf;
