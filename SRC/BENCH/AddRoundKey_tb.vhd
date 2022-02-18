--Fichier: AddRoundKey_tb.vhd
--Auteur: Patryk CHLANDA
--Projet: AES 128 en VHDL
-------
--Copyright 2021, Patryk Chlanda


library ieee;
use ieee.std_logic_1164.all;
library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;
use LIB_AES.convertion_function_package.all; --pas necessaire

entity AddRoundKey_tb is
end entity AddRoundKey_tb;

architecture AddRoundKey_tb_arch of AddRoundKey_tb is

  component AddRoundKey
    port(
	state_o: out type_state;
	round_k_i: in type_state;
	state_i: in type_state
    );
  end component;
  --signaux utiles
  signal state_i_s, state_o_s, round_k_i_s :  type_state;

begin

	DUT: addroundkey port map(
		state_o => state_o_s,
		state_i => state_i_s,
		round_k_i => round_k_i_s
	);

	--test des rounds du pdf
	--state_i_s <= bit128_to_type_state("7fc424b9d4fad817f53a3f6f425dfb84");

	--round_k_i_s <= bit128_to_type_state("0b69f609b885cd571552d97a4b75706b");

	-- ROUND 9 : 7f d4 f5 42 c4 fa 3a 5d 24 d8 3f fb b9 17 6f 84
	state_i_s <= ((x"7f", x"c4", x"24", x"b9"),(x"d4", x"fa", x"d8", x"17"),(x"f5", x"3a", x"3f", x"6f"),(x"42", x"5d", x"fb", x"84"));
	-- ROUND 9 : 0b b8 15 4b 69 85 52 75 f6 cd d9 70 09 57 7a 6b
	round_k_i_s <=((x"0b", x"69", x"f6", x"09"),(x"b8", x"85", x"cd", x"57"),(x"15", x"52", x"d9", x"7a"),(x"4b", x"75", x"70", x"6b"));

	-- ROUND 8 : a2 80 ef ca 6e 61 77 2d a2 bc f5 0c 6d f1 08 1b
	--state_i_s <= ((x"a2", x"6e", x"a2", x"6d"),(x"80", x"61", x"bc", x"f1"),(x"ef", x"77", x"f5", x"08"),(x"ca", x"2d", x"0c", x"1b"));
	-- ROUND 8 :  27 c9 51 36 62 3d 47 3e 9f 48 8b 05 ff 9a a3 1b
	-- 	round_k_i_s <=((x"27", x"62", x"9f", x"ff"),(x"c9", x"3d", x"48", x"9a"),(x"51", x"47", x"8b", x"a3"),(x"36", x"3e", x"05", x"1b") );


end architecture AddRoundKey_tb_arch;
