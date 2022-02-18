--Fichier: MatrixMultiplier.vhd
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
entity MatrixMultiplier is
    port (
        data_i : in column_state;
        data_o : out column_state
    );
end MatrixMultiplier;

--architecture
architecture MatrixMultiplier_arch of MatrixMultiplier is

	signal data2_s :column_state; --on multiplie par 2
	signal data4_s: column_state; --on multiplie par 4
	signal data8_s: column_state; --on multiplie ar 8
	signal data9_s: column_state; --on multiplie par 9
	signal datab_s: column_state; --on multiplie par 0x0b
	signal datad_s: column_state; --on multiplie par 0x0d
	signal datae_s: column_state; --on multiplie par 0x0e

begin
	--voir slides du prof vraiment bien expliqué (coeur de galois)
	label1 : for i in 0 to 3 generate
		data2_s(i) <= ((data_i(i) (6 downto 0) & '0') xor x"1B") when data_i(i)(7) = '1' else (data_i(i)(6 downto 0) & '0');
		data4_s(i) <= ((data2_s(i) (6 downto 0) & '0') xor x"1B") when data2_s(i)(7) = '1' else (data2_s(i)(6 downto 0) & '0');
		data8_s(i) <= ((data4_s(i) (6 downto 0) & '0') xor x"1B") when data4_s(i)(7) = '1' else (data4_s(i)(6 downto 0) & '0');
		data9_s(i) <= data8_s(i) xor data_i(i);
		datab_s(i) <= data9_s(i) xor data2_s(i);
		datad_s(i) <= data9_s(i) xor data4_s(i);
		datae_s(i) <= data8_s(i) xor data4_s(i) xor data2_s(i);
		end generate;

--résultats finaux
data_o(0) <= datae_s(0) xor datab_s(1) xor datad_s(2) xor data9_s(3);
data_o(1) <= data9_s(0) xor datae_s(1) xor datab_s(2) xor datad_s(3);
data_o(2) <= datad_s(0) xor data9_s(1) xor datae_s(2) xor datab_s(3);
data_o(3) <= datab_s(0) xor datad_s(1) xor data9_s(2) xor datae_s(3);

end architecture;





