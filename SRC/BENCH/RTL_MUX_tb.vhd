--Fichier: RTL_MUX_tb.vhd
--Auteur: Patryk CHLANDA
--Projet: AES 128 en VHDL
-------
--Copyright 2021, Patryk Chlanda

library ieee;
use ieee.std_logic_1164.all;
library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

entity RTL_MUX_tb is
end entity RTL_MUX_tb ;

architecture RTL_MUX_tb_arch of RTL_MUX_tb is
	component RTL_MUX

	port(
		O_o: out bit128;
		I0_i: in bit128;
		S_i: in std_logic;
		I1_i: in bit128
);

end component;

signal S_i_s : std_logic;	
signal  O_o_s, I0_i_s, I1_i_s: bit128;
	    
begin
	DUT:RTL_MUX
	port map(
			O_o=>O_o_s,	
			I0_i=>I0_i_s,
			S_i=>S_i_s,
			I1_i=>I1_i_s

		);
		
--I0_i_s<=x"11111111111111111111111111111111";
--I1_i_s<=x"10000000000000000000000000000001";
--S_i_s<='0', '1' after 60 ns;

--I0_i_s<=x"01010101010101010101010101010101";
--I1_i_s<=x"10000000000000000000000000000001";
--S_i_s<='0', '1' after 120 ns;

I0_i_s<=x"00000000000000000000000000000000";
I1_i_s<=x"10000000000000000000000000000001";
s_i_s<='0', '1' after 180 ns;

end architecture RTL_MUX_tb_arch;

