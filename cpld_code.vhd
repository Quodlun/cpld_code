library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity cpld_code is
port
(
	bcd		: in std_logic_vector ( 3 downto 0 );
	
	scan	: out std_logic;
	seg_out	: out std_logic_vector ( 7 downto 0 )
);

end cpld_code;

architecture beh of cpld_code is
begin
	scan <= '1';
	
	seg_out <= "01101111" when ( bcd = 9 ) else
			   "01111111" when ( bcd = 8 ) else
			   "00000111" when ( bcd = 7 ) else
			   "01111101" when ( bcd = 6 ) else
			   "01101101" when ( bcd = 5 ) else
			   "01100110" when ( bcd = 4 ) else
			   "01001111" when ( bcd = 3 ) else
			   "01011011" when ( bcd = 2 ) else
			   "00000110" when ( bcd = 1 ) else
			   "01111001" when ( bcd > 9 ) else
			   "00111111";
end beh;