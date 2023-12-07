library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity cpld_code is
port
(	
	sw_in			: in std_logic_vector ( 8 downto 0 );
	scansw_in		: in std_logic;
	
	scan_out		: out std_logic_vector ( 1 downto 0 );
	seg_out			: out std_logic_vector ( 7 downto 0 )
);

end cpld_code;

architecture df of cpld_code is
	signal bcd		:std_logic_vector ( 3 downto 0 );
Begin
	with scansw_in select
	scan_out <= "01" when '0',
				"10" when others;
				
	process (sw_in)
	begin
		if	  ( sw_in (8) = '1' ) then bcd <= "1001";
		elsif ( sw_in (7) = '1' ) then bcd <= "1000";
		elsif ( sw_in (6) = '1' ) then bcd <= "0111";
		elsif ( sw_in (5) = '1' ) then bcd <= "0110";
		elsif ( sw_in (4) = '1' ) then bcd <= "0101";
		elsif ( sw_in (3) = '1' ) then bcd <= "0100";
		elsif ( sw_in (2) = '1' ) then bcd <= "0011";
		elsif ( sw_in (1) = '1' ) then bcd <= "0010";
		elsif ( sw_in (0) = '1' ) then bcd <= "0001";
		else  bcd <= "0000";
		end if;
	end process;
	
	seg_out <= "01101111" when ( bcd = 9 ) else
			   "01111111" when ( bcd = 8 ) else
			   "00000111" when ( bcd = 7 ) else
			   "01111101" when ( bcd = 6 ) else
			   "01101101" when ( bcd = 5 ) else
			   "01100110" when ( bcd = 4 ) else
			   "01001111" when ( bcd = 3 ) else
			   "01011011" when ( bcd = 2 ) else
			   "00000110" when ( bcd = 1 ) else
			   "00111111";
end df;