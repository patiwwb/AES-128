--Fichier: MatrixMultiplier_tb.vhd
--Auteur: Patryk CHLANDA
--Projet: AES 128 en VHDL
-------
--Copyright 2021, Patryk Chlanda


library ieee;
use ieee.std_logic_1164.all;
library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

entity MatrixMultiplier_tb is
end MatrixMultiplier_tb;

architecture MatrixMultiplier_tb_arch of MatrixMultiplier_tb is

component MatrixMultiplier

        port (data_i : in column_state;
              data_o : out column_state);

end component;
--signaux utiles
signal data_i_s, data_o_s : column_state;

begin

    DUT : MatrixMultiplier
    port map(
        data_i => data_i_s,
        data_o => data_o_s);
	-- AddRoundKey ROUND 9 : 74 6c e0 09 ad 7f 68 28 d2 15 e6 8b b0 40 15 ef
	--data_i_s <=(x"74", x"6c", x"e0", x"09");
	data_i_s <=(x"ad", x"7f", x"68", x"28");
	--data_i_s(0) <= X"ad";
	--data_i_s(1) <= X"7f";
	--data_i_s(2) <= X"68";
	--data_i_s(3) <= X"28";
    --data_i_s <=(x"74", x"6c", x"e0", x"09");
	--data_i_s <= "74 6c e0 09";
	--data_i_s(0) <= X"74";
	--data_i_s(1) <= X"6c";
	--data_i_s(2) <= X"e0";
	--data_i_s(3) <= X"09";
end architecture MatrixMultiplier_tb_arch; 

