--Fichier: convertion_function_package.vhd
--Auteur: Patryk CHLANDA
--Projet: AES 128 en VHDL
-------
--Copyright 2021, Patryk Chlanda


--Conversion between bit128 <--> type_state
library IEEE;
use IEEE.STD_LOGIC_1164.all;

library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

package convertion_function_package is

	function bit128_to_type_state( input : bit128) return type_state;
	function  type_state_to_bit128( input : type_state) return bit128;

end convertion_function_package;

package body convertion_function_package is

	function bit128_to_type_state( input : bit128) return type_state is
	variable result : type_state;
	begin 
		for i in 0 to 3 loop
			for j in 0 to 3 loop
				result(i)(j) := input((127 - 32 * i - 8 * j) downto (120 - 32 * i - 8 * j));
			end loop;
		end loop;
		return result;
				
	end bit128_to_type_state;

	function type_state_to_bit128( input : type_state) return bit128 is
	variable result : bit128;
	begin
	for i in 0 to 3 loop
		for j in 0 to 3 loop
			result((127 - 32 * i - 8 * j) downto (120 - 32 * i - 8 * j)) := input(i)(j);
		end loop;
	end loop;
	return result;
				
	end type_state_to_bit128;

end convertion_function_package;


