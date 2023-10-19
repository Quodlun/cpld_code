library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity cpld_code is
port
(
	A	: in std_logic;
	B	: in std_logic;
	Ci	: in std_logic;
	
	S	: out std_logic;
	Co	: out std_logic
);

end cpld_code;

architecture df of cpld_code is
begin
	S <= A XOR B XOR Ci;
	Co <= ( A AND B ) OR ( B AND Ci ) OR ( A AND Ci );	
	
end df;