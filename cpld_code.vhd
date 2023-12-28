library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity cpld_code is
generic ( fmax : integer := 24E6 );
port (
	clk		: in std_logic;
	
	scan	: out std_logic;
	seg_out	: out std_logic_vector ( 7 downto 0 )
	);
end cpld_code;

architecture beh of cpld_code is
	signal bcd : std_logic_vector ( 3 downto 0 );
	signal f_1 : std_logic;

begin
	scan <= '1';
	
	process ( clk )
	variable cnt_p	: std_logic_vector ( 24 downto 0 );
	variable fo		: integer := 1;
	
	begin
		if ( clk'event and clk = '1' )then
			if ( cnt_p < fmax / fo - 1 ) then
				f_1		<= '0';
				cnt_p	:= cnt_p + 1;
				
			else
				f_1		<= '1';
				cnt_p	:= ( others => '0' );
				
			end if;
		end if;
	end process;
	
	process ( clk )
	variable bcd_cnt	: std_logic_vector ( 3 downto 0 );
	
	begin
		if ( clk'event and clk = '1' ) then
			if ( f_1 = '1' ) then
				if ( bcd_cnt > 0 ) then
					bcd_cnt	:= bcd_cnt - 1;

				else
					bcd_cnt := "1001";
					
				end if;
				bcd <= bcd_cnt;
				
			end if;
		end if;
	end process;
	
	seg_out	<= "01101111" when ( bcd = 9 ) else
			   "01111111" when ( bcd = 8 ) else
			   "00000111" when ( bcd = 7 ) else
			   "01111101" when ( bcd = 6 ) else
			   "01101101" when ( bcd = 5 ) else
			   "01100110" when ( bcd = 4 ) else
			   "01001111" when ( bcd = 3 ) else
			   "01011011" when ( bcd = 2 ) else
			   "00000110" when ( bcd = 1 ) else
			   "00111111" ;
			   
end beh;