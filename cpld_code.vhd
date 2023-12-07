library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity cpld_code is
port
(	
	A			: in std_logic;
	B			: in std_logic;
	
	F1, F2, F3	: out std_logic
);

end cpld_code;

architecture df of cpld_code is

begin
	process (A, B)
	begin
		F1 <= '0';
		F2 <= '0';
		F3 <= '0';
		
		if ( A < B ) then F1 <= '1'; end if;
		if ( A = B ) then F2 <= '1'; end if;
		if ( A > B ) then F3 <= '1'; end if;
	end process;
end df;