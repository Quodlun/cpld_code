library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity cpld_code is
port
(
	sw_in	: in std_logic_vector ( 8 downto 0 );
	
	bcd		: out std_logic_vector ( 3 downto 0 )
);

end cpld_code;

architecture df of cpld_code is
begin
	bcd <= "1001" when ( sw_in ( 8 ) = '1' ) else
		   "1000" when ( sw_in ( 7 ) = '1' ) else
		   "0111" when ( sw_in ( 6 ) = '1' ) else
		   "0110" when ( sw_in ( 5 ) = '1' ) else
		   "0101" when ( sw_in ( 4 ) = '1' ) else
		   "0100" when ( sw_in ( 3 ) = '1' ) else
		   "0011" when ( sw_in ( 2 ) = '1' ) else
		   "0010" when ( sw_in ( 1 ) = '1' ) else
		   "0001" when ( sw_in ( 0 ) = '1' ) else
		   "0000";
end df;