--Fichier: FSM_InvAES_tb.vhd
--Auteur: Patryk CHLANDA
--Projet: AES 128 en VHDL
-------
--Copyright 2021, Patryk Chlanda


library ieee;
use ieee.std_logic_1164.all;
library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

entity FSM_InvAES_tb is
end entity FSM_InvAES_tb;

architecture FSM_InvAES_tb_arch of FSM_InvAES_tb is 

	component FSM_InvAES 
		port (
			done_o : out std_logic; --pour fin
			enableCounter_o : out std_logic;
			enableInvMixColumns_o : out std_logic;
			enableOutput_o : out std_logic;
			round_i : in bit4;
			start_i : in std_logic;
			clock_i : in std_logic;
			resetb_i : in std_logic;
			enableRoundcomputing_o : out std_logic;
			getciphertext_o : out std_logic;
			resetCounter_o : out std_logic
		);
	end component;

	--def des signaux
	signal round_i_s : bit4;
	signal clock_i_s : std_logic := '0';
	-- autres signaux utiles
	signal resetb_i_s, start_i_s, enableCounter_o_s, done_o_s, enableInvMixColumns_o_s,enableOutput_o_s, enableRoundComputing_o_s, getciphertext_o_s, resetCounter_o_s: std_logic;

	--dispositif under test 
	begin 
		DUT : FSM_InvAES port map (
			start_i => start_i_s,
			done_o => done_o_s,
			enableCounter_o => enableCounter_o_s,
			enableInvMixColumns_o => enableInvMixColumns_o_s,
			enableOutput_o => enableOutput_o_s,
			clock_i => clock_i_s,
			resetb_i => resetb_i_s,
			round_i => round_i_s,
			enableRoundComputing_o => enableRoundComputing_o_s,
			getciphertext_o => getciphertext_o_s,
			resetCounter_o => resetCounter_o_s
		);

--CHRONOGRAMME
--clock_i_s <= clock_i_s after 100 ns;
clock_i_s <= not clock_i_s after 100 ns;
round_i_s <= "1010" after 100 ns, "1001" after 300 ns, "1000" after 500 ns, "0111" after 700 ns, "0110" after 900 ns, "0101" after 1100 ns, "0100" after 1300 ns, "0011" after 1500 ns, "0010" after 1700 ns, "0001" after 1900 ns, "0000" after 2100 ns;
		
resetb_i_s <= '1';--'1', '0' after 30 ns, '1' after 40 ns;
start_i_s <= '1';--'0', '1' after 50 ns, '0' after 200 ns;

end architecture FSM_InvAES_tb_arch;
