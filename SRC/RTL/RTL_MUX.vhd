--Fichier: RTL_MUX.vhd
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
entity RTL_MUX is
	port(
		I0_i: in bit128;
		I1_i: in bit128;
		S_i: in std_logic;
		O_o: out bit128
	);
	end RTL_MUX;

--architecture
architecture RTL_MUX_Arch of RTL_MUX is
begin
	O_o<= I0_i when  S_i='1' else I1_i;
end RTL_MUX_Arch;
