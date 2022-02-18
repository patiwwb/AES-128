--Fichier: InvSubBytes_tb.vhd
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

entity InvSubBytes_tb is
end entity InvSubBytes_tb;

architecture InvSubBytes_tb_arch of InvSubBytes_tb is

  component InvSubBytes
    port(
      state_o: out type_state;
	  state_i: in type_state
    );
  end component;
  --signaux utiles
  signal state_i_s, state_o_s: type_state;

begin

  DUT: InvSubBytes port map(
    state_o => state_o_s,
	state_i => state_i_s
  );

  --state_i_s <= bit128_to_type_state("6b88a6db19142d8777a22506f68d634f"); --mieux vaut pas utiliser de fonction

  state_i_s <= ((x"6b", x"88", x"a6", x"db"),(x"19", x"14", x"2d", x"87"),(x"77", x"a2", x"25", x"06"),
(x"f6", x"8d", x"63", x"4f"));
			   
	--state_i_s(0)(0)<= X"6b";
	--state_i_s(0)(1)<= X"88";
	--state_i_s(0)(2)<= X"a6";
	--state_i_s(0)(3)<= X"db";
	--state_i_s(1)(0)<= X"19";
	--state_i_s(1)(1)<= X"14";
	--state_i_s(1)(2)<= X"2d";
	--state_i_s(1)(3)<= X"87";
	--state_i_s(2)(0)<= X"77";
	--state_i_s(2)(1)<= X"a2";
	--state_i_s(2)(2)<= X"25";
	--state_i_s(2)(3)<= X"06";
	--state_i_s(3)(0)<= X"f6";
	--state_i_s(3)(1)<= X"8d";
	--state_i_s(3)(2)<= X"63";
	--state_i_s(3)(3)<= X"4f";

	
end architecture InvSubBytes_tb_arch;
