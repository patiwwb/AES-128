--Fichier: RTL_REG.vhd
--Auteur: Patryk CHLANDA
--Projet: AES 128 en VHDL
-------
--Copyright 2021, Patryk Chlanda


library ieee;
use ieee.std_logic_1164.all;
library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

entity RTL_REG is
	port (
		C_i : in std_logic;
		D_i : in bit128;
		Q_o : out bit128
	);
end entity RTL_REG;

architecture RTL_REG_arch of RTL_REG is
	
	begin
		
		seq_0 : process(C_i)
			begin
				if C_i = '1' then
					Q_o <= D_i;
				end if;
		end process seq_0;
		
		
end architecture RTL_REG_arch;
