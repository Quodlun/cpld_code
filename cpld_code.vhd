library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity cpld_code is
generic ( fmax
port (
	clk		: in std_logic;
	
	wave_s	: out std_logic;
	wave_p	: out std_logic
	);
end cpld_code;

architecture beh of cpld_code is
	signal fo : integer = 24E5;

begin
	process ( clk )
	variable cnt_S	: std_logic_vector ( 3 downto 0 );
	
	begin
		if ( clk'event and clk = '1' ) then
			if ( cnt_S < fmax / ( 2 * fo ) - 1 ) then
				wave_s <= '0';
				cnt_S  := cnt_S + 1;
			
			elsif ( cnt_S < fmax / fo - 1 ) then
				wave_s <= '1';
				cnt_S  := cnt_S + 1;
			
			else
				wave_s <= '0';
				cnt_S  := ( other => '0' );
			
			end if;
		end if;
	end process

	process ( clk )
	variable cnt_p	: std_logic_vector ( 3 downto 0 );
	
	begin
		if ( clk'event and clk = '1' ) then
			if ( cnt_P < fmax / fo - 1 ) then
				wave_p <= '0';
				cnt_p  := cnt_p + 1
				
			else
				wave_p <= '1';
				cnt_p  := ( others => '0' );
			end if;
		end if;
	end process;
end beh;