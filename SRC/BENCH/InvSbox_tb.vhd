--Fichier: InvSbox_tb.vhd
--Auteur: Patryk CHLANDA
--Projet: AES 128 en VHDL
-------
--Copyright 2021, Patryk Chlanda


library ieee;
use ieee.std_logic_1164.all;
library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

entity InvSbox_tb is
end InvSbox_tb;

architecture InvSbox_tb_arch of InvSbox_tb is
	--appel component
	component InvSbox
		port (
			data_i  : in bit8;
			data_o : out bit8 );
	end component;
	--signaux utilises
	signal data_i_s : bit8;
	signal data_o_s : bit8;
	begin 
		DUT : InvSbox
		
		port map (
			data_i => data_i_s,
    		data_o => data_o_s
			);
			
		--CHRONOGRAMME
		-- data_i_s <= x"00", x"01" after 5 ns, x"11" after 10 ns, x"22" after 15 ns, x"33" after 20 ns, x"bb" after 25 ns, x"de" after 30ns;
		--test premiere case, exemple du tableau et derniere case 
		data_i_s <= x"00", x"53" after 5 ns, x"FF" after 10 ns, x"99" after 15 ns, x"AA" after 20 ns;
   		-- data_i_s <= x"AA", x"99" after 5 ns, x"FF" after 10 ns, x"53" after 15 ns, x"00" after 20 ns;

		-- on testera une valeur tout les 200ns car le compteur augmente
		--Proc1 : process
		--variable compt : bit8 := "00000000"; 
		--begin
			--wait for 200 ns; 
			--if compt ="11111111" then
				--compt := "00000000";
			--else
				--compt := compt+1;
			--end if;
			--data_i_s <= compt;
		--end process Proc1;

end InvSbox_tb_arch;
