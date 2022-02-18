--Fichier: InvMixColumns_tb.vhd
--Auteur: Patryk CHLANDA
--Projet: AES 128 en VHDL
-------
--Copyright 2021, Patryk Chlanda


library ieee;
use ieee.std_logic_1164.all;
library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;
use LIB_AES.convertion_function_package.all;

entity InvMixColumns_tb is
end entity InvMixColumns_tb;

architecture InvMixColumns_tb_arch of InvMixColumns_tb is

component InvMixColumns
    port(
      state_i: in type_state;
      state_o: out type_state
    );
  end component;
 --signaux utiles
  signal state_i_s, state_o_s: type_state;

begin

  DUT: InvMixColumns port map(
    state_i => state_i_s,
    state_o => state_o_s
  );

  --state_i_s <= bit128_to_type_state("74add2b06c7f1540e068e61509288bef");
  -- Better to not use functions --> think hardware logic !
  -- 74 6c e0 09 ad 7f 68 28 d2 15 e6 8b b0 40 15 ef
  --ROUND 9 debug
  state_i_s <= ((x"74", x"ad", x"d2", x"b0"),(x"6c", x"7f", x"15", x"40"),(x"e0", x"68", x"e6", x"15"),(x"09", x"28", x"8b", x"ef"));
	--ROUND 8
	-- 85 49 be fc 0c 5c 30 13 3d f4 7e 09 92 6b ab 00
	--  state_i_s <= ((x"85", x"0c", x"3d", x"92"),(x"49", x"5c", x"f4", x"6b"),(x"be", x"30", x"7e", x"ab"),(x"fc", x"13", x"09", x"00"));
	--ROUND 7
	-- 64 4a 16 ed fd bf 54 04 45 38 d7 2b 1f 7d 21 ed
	-- state_i_s <= ((x"64", x"fd", x"45", x"1f"),(x"4a", x"bf", x"38", x"7d"),(x"16", x"54", x"d7", x"21"),(x"ed", x"04", x"2b", x"ed"));
	

end architecture InvMixColumns_tb_arch;
