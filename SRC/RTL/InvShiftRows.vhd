--Fichier: *InvShiftRows.vhd
--Auteur: Patryk CHLANDA
--Projet: AES 128 en VHDL
-------
--Copyright 2021, Patryk Chlanda


library ieee;
use ieee.std_logic_1164.all;
library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

entity InvShiftRows is
	port (
		state_i: in type_state;
		state_o: out type_state
		);
end InvShiftRows;

architecture InvShiftRows_arch of InvShiftRows is
begin
	--on assigne les valeurs à la main on aurait pu faire une boucle
	state_o(0)(0) <= state_i(0)(0);
	state_o(0)(1) <= state_i(0)(1);
	state_o(0)(2) <= state_i(0)(2);
	state_o(0)(3) <= state_i(0)(3);
	state_o(1)(0) <= state_i(1)(3);
	state_o(1)(1) <= state_i(1)(0);
	state_o(1)(2) <= state_i(1)(1);
	state_o(1)(3) <= state_i(1)(2);
	state_o(2)(0) <= state_i(2)(2);
	state_o(2)(1) <= state_i(2)(3);
	state_o(2)(2) <= state_i(2)(0);
	state_o(2)(3) <= state_i(2)(1);
	state_o(3)(0) <= state_i(3)(1);
	state_o(3)(1) <= state_i(3)(2);
	state_o(3)(2) <= state_i(3)(3);
	state_o(3)(3) <= state_i(3)(0);

end architecture;

