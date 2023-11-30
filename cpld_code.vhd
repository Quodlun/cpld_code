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
	with S select
	Y(0) <= I when "00",
			'0' when others;
	
	with S select
	Y(1) <= I when "01",
			'0' when others;
	
	with S select
	Y(2) <= I when "10",
			'0' when others;
	
	with S select
	Y(3) <= I when "11",
			'0' when others;
end df;	