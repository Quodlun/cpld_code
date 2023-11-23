library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity cpld_code is
port
(
	X	: in std_logic;
	Y	: in std_logic;
	Bi	: in std_logic;
	
	D	: out std_logic;
	Bo	: out std_logic
);

end cpld_code;

architecture df of cpld_code is
begin
	process ( X, Y, Bi )
	
	begin
		D <= X XOR Y XOR Bi;
		Bo <= ( ( NOT X ) AND Y ) OR ( ( NOT X) AND Bi ) OR ( Y AND Bi );	
	
	end process;
end df;