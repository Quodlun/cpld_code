library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity cpld_code is
port
(	
	clk				: in std_logic;
	PR, CLR			: in std_logic;
	J, K			: in std_logic;
	
	Q				: buffer std_logic
);

end cpld_code;

architecture df of cpld_code is
	signal JK		:std_logic_vector ( 1 downto 0 );
Begin
	JK <= J & K;
	
	process ( clk )
	begin
		if ( PR = '1' ) then
			Q <= '1';
			
		elsif ( CLR = '1' ) then
			Q <= '0';
			
		elsif ( clk'event and clk = '1') then
			if ( JK = "00" ) then
				Q <= Q;
				end if;
			
			if ( JK = "01" ) then
				Q <= '0';
				end if;
				
			if ( JK = "10" ) then
				Q <= '1';
				end if;
				
			if ( JK = "11" ) then
				Q <= NOT Q;
				end if;				
			end if;
	end process;
end df;