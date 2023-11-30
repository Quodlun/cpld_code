library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity cpld_code is
port
(
	I	: in std_logic_vector ( 3 downto 0 );
	S	: in std_logic_vector ( 1 downto 0 );
	
	Y	: out std_logic
);

end cpld_code;

architecture df of cpld_code is

begin
	with S select
	
	Y <= I(0) when "00",
		 I(1) when "01",
		 I(2) when "10",
		 I(3) when others;
end df;