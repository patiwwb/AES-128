--Fichier: RTL_REG_tb.vhd
--Auteur: Patryk CHLANDA
--Projet: AES 128 en VHDL
-------
--Copyright 2021, Patryk Chlanda


library ieee;
use ieee.std_logic_1164.all;
library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

entity RTL_REG_tb is
end RTL_REG_tb;

architecture RTL_REG_tb_arch of RTL_REG_tb is

 component RTL_REG is
	port(
		D_i : in bit128;
		Q_o : out bit128;
        C_i : in std_logic

	);
end component;

		signal D_i_s, Q_o_s : bit128;
		signal C_i_s : std_logic;


begin
		DUT : RTL_REG
		port map(
			C_i => C_i_s,
			D_i => D_i_s,
			Q_o => Q_o_s
		);

--C_i_s <= '0','1' after 200 ns,'0' after 400 ns,'1' after 600 ns ;
--D_i_s <= x"111111111111111111111111111111",x"10000000000000000000000000000000" after 200 ns,x"20000000000000000000000000000000" after 400 ns,x"30000000000000000000000000000000" after 600 ns ;


C_i_s <= '0','1' after 100 ns,'0' after 200 ns,'1' after 300 ns ;
D_i_s <= x"00000000000000000000000000000000",x"10000000000000000000000000000000" after 100 ns,x"20000000000000000000000000000000" after 200 ns,x"30000000000000000000000000000000" after 300 ns ;

--C_i_s <= '0','1' after 200 ns,'0' after 400 ns,'1' after 600 ns ;
--D_i_s <= x"00000000000000000000000000000000",x"10000000000000000000000000000000" after 200 ns,x"20000000000000000000000000000000" after 400 ns,x"30000000000000000000000000000000" after 600 ns ;

--C_i_s <= '0','1' after 100 ns,'0' after 800 ns,'1' after 1200 ns ;
--D_i_s <= x"30000000000000000000000000000000",x"20000000000000000000000000000000" after 400 ns,x"10000000000000000000000000000000" after 800 ns,x"00000000000000000000000000000000" after 1200 ns ;

end  RTL_REG_tb_arch;

