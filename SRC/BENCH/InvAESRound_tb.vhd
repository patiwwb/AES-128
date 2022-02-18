--Fichier: InvAESRound_tb.vhd
--Auteur: Patryk CHLANDA
--Projet: AES 128 en VHDL
-------
--Copyright 2021, Patryk Chlanda


library ieee;
use ieee.std_logic_1164.all;
library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

entity InvAESRound_tb is
end InvAESRound_tb;

architecture InvAESRound_tb_arch of InvAESRound_tb is
    component InvAESRound is
        port (
    currenttext_i: in bit128;
    enableInvMixcolumns_i: in std_logic;
	clock_i: in std_logic;
    currentkey_i: in bit128;
    enableRoundcomputing_i: in std_logic;
    resetb_i: in std_logic;
    data_o: out bit128
        );
    end component;
    --signaux utiles
	
    signal currentkey_i_s, currenttext_i_s, data_o_s : bit128 ;
	--signal clock_i_s : std_logic := '1'; -- NO
	signal clock_i_s : std_logic := '0';
	signal enableInvMixcolumns_i_s, enableRoundcomputing_i_s, resetb_i_s : std_logic;


begin

    DUT : InvAESRound
    port map(
        enableInvMixcolumns_i => enableInvMixcolumns_i_s,
        enableRoundcomputing_i => enableRoundcomputing_i_s,
		clock_i => clock_i_s,
        currentkey_i => currentkey_i_s,
        resetb_i => resetb_i_s,
        currenttext_i => currenttext_i_s,
        data_o => data_o_s
    );

--chrono
enableInvMixcolumns_i_s <= '0', '1' after 400 ns, '0' after 800 ns;
enableRoundcomputing_i_s <= '0', '1' after 400 ns;
resetb_i_s <= '1','0' after 10 ns, '1' after 30 ns;
clock_i_s <= not clock_i_s after 100 ns;

--ROUND 10 9 8
currentkey_i_s <= x"e705100b8e80427e784d9b0e711ae165", x"0bb8154b69855275f6cdd97009577a6b" after 400 ns,x"2b7e151628aed2a6abf7158809cf4f3c" after 800 ns;
--ROUND 7 6 5
--currentkey_i_s <= x"d827b8a645f41608fd75cc3b60d2281e", x"11897ad39dd3aeaeb881da339da7e425" after 400 ns,x"125885118c5ad47d2552749d25263e16" after 800 ns;
currenttext_i_s <= x"8c11354406ad4488decaec83aa034306", x"6b14254f882d06f6a687778ddb19a263" after 400 ns, x"58e646d58dc606abcece763172f35a9c" after 800 ns;

end architecture;

