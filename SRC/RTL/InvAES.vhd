--Fichier: InvAES.vhd
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
entity InvAES is 
	port (
		data_i : in bit128;
		aes_on_o : out std_logic;
		data_o : out bit128;
		start_i : in std_logic;
		clock_i : in std_logic;
		reset_i : in std_logic

	);
end entity InvAES;


--architecture
architecture InvAES_arch of InvAES is

	--composant de InvAESRound
	component InvAESRound is 
		port (
			enableInvMixColumns_i : in std_logic;
			clock_i : in std_logic;
			enableRoundComputing_i : in std_logic;
			currentkey_i : in bit128;
			currenttext_i : in bit128;
			resetb_i : in std_logic; 
			data_o : out bit128
		);
	end component;
	
	--composant de la machine d'etat
	component FSM_InvAES is
		port (

			enableRoundcomputing_o : out std_logic;
			getciphertext_o : out std_logic;
			resetCounter_o : out std_logic;
			round_i : in bit4; 
			clock_i : in std_logic;
			resetb_i : in std_logic;
			start_i : in std_logic;
			done_o : out std_logic;
			enableCounter_o : out std_logic;
			enableInvMixColumns_o : out std_logic;
			enableOutput_o : out std_logic

		);
	end component;
	
	--composant de la table de substitution
	component KeyExpansion_table is
		port (
			round_i : in bit4;
			expansion_key_o : out bit128
		);
	end component;

--composant du multiplexeur
	component RTL_MUX is
		port (
			I0_i : in bit128;
			S_i : in std_logic;
			I1_i : in bit128;
			O_o : out bit128
		);
	end component;
	
	--composant du register
	component RTL_REG is
		port (
			D_i : in bit128;
			C_i : in std_logic;
			Q_o : out bit128
		);
	end component;

--composant du compteur decroissant
	component Counter is
		port (
			enable_i : in std_logic;
			resetb_i : in std_logic;
			clock_i : in std_logic;
			count_o : out bit4
		);
	end component;

	--definition des signaux
	signal key_s, currenttext_s, register_i_s: bit128;
	signal round_s : bit4; --4 bits suffisent pour nos rounds
	
	signal enableCounter_s, enableInvMixColumns_s, resetb_s, enableOutput_s, enableRoundComputing_s, getcyphertext_s, done_s, resetCounter_s: std_logic;

	begin

		iter : InvAESRound
			port map (
				currenttext_i => currenttext_s,
				enableInvMixColumns_i => enableInvMixColumns_s,
				enableRoundComputing_i => enableRoundComputing_s,
				clock_i => clock_i,
				currentkey_i => key_s,
				resetb_i => resetb_s,
				data_o => register_i_s
			);		

		compteur : Counter
			port map (
				resetb_i => resetCounter_s,
				clock_i => clock_i,
				enable_i => enableCounter_s,
				count_o => round_s
			);
			

		machine_etat : FSM_InvAES
			port map (
				enableCounter_o => enableCounter_s,
				enableInvMixColumns_o => enableInvMixColumns_s,
				done_o => aes_on_o,
				enableOutput_o => enableOutput_s,
				enableRoundcomputing_o => enableRoundComputing_s,
				clock_i => clock_i,
				resetb_i => resetb_s,
				round_i => round_s,
				start_i => start_i,
				getciphertext_o => getcyphertext_s,
				resetCounter_o => resetCounter_s
			);
			
		multiplex : RTL_MUX
			port map (
				S_i => getcyphertext_s,
				I0_i => data_i,
				I1_i => register_i_s,
				O_o => currenttext_s
			);
		
		registre : RTL_REG
			port map (
				C_i => enableOutput_s,
				D_i => register_i_s,
				Q_o => data_o
			);	
			
		key_table : KeyExpansion_table
			port map (
			expansion_key_o => key_s,
			round_i => round_s
		);	

					
		resetb_s <= not reset_i;
						
	
end architecture InvAES_arch;

configuration InvAES_conf of InvAES is
	for InvAES_arch
		for all : Counter
			use entity LIB_RTL.Counter(Counter_arch);
		end for;
		for all : FSM_InvAES
			use entity LIB_RTL.FSM_InvAES(FSM_InvAES_arch);
		end for;
		for all : KeyExpansion_table
			use entity LIB_RTL.KeyExpansion_table(KeyExpansion_table_arch);
		end for;
		for all : RTL_MUX
			use entity LIB_RTL.RTL_MUX(RTL_MUX_arch);
		end for;
    		for all : InvAESRound
			use configuration LIB_RTL.InvAESRound_conf;
		end for;
		for all : RTL_REG
			use entity LIB_RTL.RTL_REG(RTL_REG_arch);
		end for;
	end for;
end configuration InvAES_conf;
