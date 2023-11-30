library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity cpld_code is
port
(	
	I	: in std_logic;
	S	: in std_logic_vector ( 1 downto 0 );
	
	Y	: out std_logic_vector ( 3 downto 0 )
);

end cpld_code;

architecture df of cpld_code is

begin
	Y(0) <= I when ( S = "00" ) else '0';
	Y(1) <= I when ( S = "01" ) else '0';
	Y(2) <= I when ( S = "10" ) else '0';
	Y(3) <= I when ( S = "11" ) else '0';
end df;	