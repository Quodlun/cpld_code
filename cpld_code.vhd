library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity cpld_code is
port
(
	X	: in std_logic;
	Y	: in std_logic;
	
	D	: out std_logic;
	B	: out std_logic
);

end cpld_code;

architecture df of cpld_code is
begin
	D <= X XOR Y;
	B <= ( NOT X ) AND Y;	
	
end df;