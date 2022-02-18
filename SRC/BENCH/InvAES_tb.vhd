--Fichier: InvAES_tb.vhd
--Auteur: Patryk CHLANDA
--Projet: AES 128 en VHDL
-------
--Copyright 2021, Patryk Chlanda


library ieee;
use ieee.std_logic_1164.all;
library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

entity InvAES_tb is
end entity InvAES_tb;

architecture InvAES_tb_arch of InvAES_tb is
	
	
	component InvAES is 
		port (
			data_i : in bit128;
			start_i : in std_logic;
			reset_i : in std_logic;
			data_o : out bit128;
			clock_i : in std_logic;
			aes_on_o : out std_logic
		);
	end component;
	--signaux utiles
	signal data_i_s : bit128;
	signal data_o_s : bit128;
	signal start_i_s : std_logic;
	signal clock_i_s : std_logic := '0';
	signal reset_i_s : std_logic;
	signal aes_on_o_s : std_logic;
	
	begin
		
		DUT : InvAES port map (
			reset_i => reset_i_s,
			data_i => data_i_s,
			start_i => start_i_s,
			clock_i => clock_i_s,
			data_o => data_o_s,
			aes_on_o => aes_on_o_s
		);	
		
--CHRONOGRAMME
--clock_i_s <= clock_i_s after 50 ns; --not working
clock_i_s <= not(clock_i_s) after 50 ns; --good

reset_i_s <= '0','1' after 2200 ns, '0' after 2400 ns;

start_i_s <=  '1','0' after 2000 ns,'1' after 2500 ns;

--reset_i_s <= '0';
--start_i_s <= '1';
--reset_i_s <= '1';
--start_i_s <= '0';
-- Cipher text to decipher: (Hex) 8c 11 35 44 06 ad 44 88 de ca ec 83 aa 03 43 06
--data_i_s <= x"8c11354406ad4488decaec83aa034306", x"9c11354406ad4488decaec83aa034306" after 2000 ns;
-- question bonus 
-- Combien d'octets dans 128 bits ? Réponse: 16 octets 
data_i_s <= x"0d3bf9997990f33fda7731f8f2ef88c9", x"188087135a2d9b331bc753752f2d5158" after 2000 ns;


end architecture InvAES_tb_arch;
