library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity cpld_code is
port (
	clk		: in std_logic;
	PR, CLR	: in std_logic;
	D		: in std_logic;
	
	Q		: buffer std_logic
	);
end cpld_code;

architecture beh of cpld_code is
	signal JK		: std_logic_vector ( 1 downto 0 );
	signal J1, K1	: std_logic;

	procedure jk_ff ( signal clk			: in 	std_logic;
					  signal JKPR, JKCLR 	: in 	std_logic;
					  signal J, K			: in	std_logic;
					  Signal JKQ			: inout std_logic ) is

	begin
		JK <= J & K;

		if ( JKPR = '1' ) then
			JKQ <= '1';

		elsif ( JKCLR = '1' ) then
			JKQ <= '0';

		elsif ( clk'event and clk = '1' ) then
			if ( JK = "00" ) then
				JKQ <= JKQ;
				end if;

			if ( JK = "01" ) then
				JKQ <= '0';
				end if;

			if ( JK = "10" ) then
				JKQ <= '1';
				end if;

			if ( JK = "11" ) then
				JKQ <= not JKQ;
				end if;
		end if;
	end jk_ff;	
	
begin
	J1 <= D; K1 <= not D;
	jk_ff ( clk, PR, CLR, J1, K1, Q );
	
end beh;