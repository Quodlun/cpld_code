library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity cpld_code is
generic ( fmax : integer := 24E6 );
port (
	clk			: in std_logic;
	pr, clr		: in std_logic;
	serial_in	: in std_logic;
	
	q			: buffer std_logic_vector ( 3 downto 0 )
);
end cpld_code;

architecture beh of cpld_code is

begin
	process ( clk )
	begin
		if ( pr = '1' ) then
			q <= "1111";
			
		elsif ( clr = '1' ) then
			q <= "0000";
			
		elsif ( clk' event and clk = '1' ) then
			q ( 3 ) <= q ( 2 );
			q ( 2 ) <= q ( 1 );
			q ( 1 ) <= q ( 0 );
			q ( 0 ) <= serial_in;
			
		end if;
	end process;
end beh;