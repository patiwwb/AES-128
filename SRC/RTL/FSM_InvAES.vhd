--Fichier: FSM_InvAES.vhd
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
entity FSM_InvAES is 
	port (
		enableCounter_o : out std_logic; --autorise le counter
		enableInvMixColumns_o : out std_logic;-- autorise InvMixColumns
		enableOutput_o : out std_logic; 
		enableRoundcomputing_o : out std_logic; --pour autoriser InvSubByte et InvShftRows
		resetCounter_o : out std_logic ; --signal reset counter
		clock_i : in std_logic; --signal d'horloge
		resetb_i : in std_logic; --signal reset 1 
		round_i : in bit4; --signal correspondant au n° du round actuel 
		start_i : in std_logic; --signal start
		done_o : out std_logic; -- signal fin 
		getciphertext_o : out std_logic --signal tecxt chiffré

	);
end entity FSM_InvAES;


--architecture
architecture FSM_InvAES_arch_Moore of FSM_InvAES is
	--definition des types
	type state is (idle, round_10, round_X, round_0,result);
	signal actual_state, future_state: state; --déclaration des états

	begin
	
		process1 : process (clock_i, resetb_i)
		begin
			if resetb_i = '0' then
				actual_state <= idle;
			elsif clock_i'event and clock_i = '1' then
				actual_state <= future_state;
			end if;
		end process process1;
				
		-- Les sorties/valeurs signaux selon l'etape de la FSM (voir diagramme draw.io ou feuille brouillon):
		process2 : process(actual_state)
		begin
			case actual_state is --on vérifie état reçu
				-- machine d'état selon le round (rounds décroissants) début 10 
				when idle =>
					done_o <= '0';
					enableCounter_o <= '0';
					enableInvMixColumns_o <= '0';
					enableOutput_o <= '0';
					enableRoundComputing_o <= '0';
					getciphertext_o <= '0';
					resetCounter_o <= '0';	
				when round_10 =>
					done_o <= '0';
					enableCounter_o <= '1';
					enableInvMixColumns_o <= '0';
					enableOutput_o <= '0';
					enableRoundComputing_o <= '0';
					getciphertext_o <= '1';
					resetCounter_o <= '1';	
				when round_X =>
					done_o <= '0';
					enableCounter_o <= '1';
					enableInvMixColumns_o <= '1';
					enableOutput_o <= '0';
					enableRoundComputing_o <= '1';
					getciphertext_o <= '0';
					resetCounter_o <= '1';		
				when round_0 =>
					done_o <= '0';
					enableCounter_o <= '0';
					enableInvMixColumns_o <= '0';
					enableOutput_o <= '0';
					enableRoundComputing_o <= '1';
					getciphertext_o <= '0';
					resetCounter_o <= '1';	
				when result =>
					done_o <= '1';
					enableCounter_o <= '0';
					enableInvMixColumns_o <= '0';
					enableOutput_o <= '1';
					enableRoundComputing_o <= '0';
					getciphertext_o <= '0';
					resetCounter_o <= '1';
			end case;
		end process;

		--Enchainement des etapes avec l'état futur dependant de l'état actuel
		process3 : process(round_i,start_i,actual_state)
		begin
			case actual_state is
				when idle =>
					if start_i = '1' then
						future_state <= round_10;
					else
						future_state <= idle;
					end if;
				when round_10 =>
					if round_i = "1010" then
						future_state <= round_X;
					else
						future_state <= round_10;
					end if;
				when round_X =>
					if round_i = "0001" then
						future_state <= round_0;
					else
						future_state <= round_X;
					end if;
				when round_0 =>
					if round_i = "0000" then
						future_state <= result;
					else
						future_state <= round_0;
					end if;
				when result =>
					if start_i = '0' then
						future_state <= idle;
					else
						future_state <= result;
					end if;
			end case;
		end process;
		

end architecture FSM_InvAES_arch_Moore;
