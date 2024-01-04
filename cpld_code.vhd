library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity cpld_code is
generic ( fmax : integer := 24E6 );
port (
	clk			: in std_logic;
	
	ryg1		: out std_logic_vector ( 2 downto 0 );
	ryg2		: out std_logic_vector ( 2 downto 0 )
);
end cpld_code;

architecture beh of cpld_code is
	signal rst		: std_logic;
	signal ck_1		: std_logic;

	type state_type is ( s1, s2, s3, s4, s5, s6, s7, s8, s9, s10 );
	signal sate		: state_type;
	
begin
	process ( clk )
		variable fo1k	: integer	:= 1E3;
		variable fo1	: integer	:= 1;
		variable cnt0 	: std_logic_vector ( 15 downto 0 );
		variable cntl	: std_logic_vector ( 23 downto 0 );
	
	begin
		if ( clk'event and clk = '1' ) then
			if ( cnt0 < fmax / fo1k - l) then
				cnt0 = cnt0 + 1;
				rst <= '0';
				
			else
				rst <= '1';
				
			end if;
			
			cnt1 := cnt1 + 1;
			
			if ( cnt1 < fmax / fol - l ) then
				ck_1 <= '0';
				
			else
				cl_1 <= '1';
				cnt1 := ( others => '0' );
				
			end if;
		end if;
	end process;
	
	process ( clk, rst )
	begin
		if ( rst = 'O' ) then
			state <= s1;
			
		elsif ( clk'event and clk = 'l' ) then 
			if ( ck_l = 'l' ) then
				case state is
					when s1 => state <= s2;
					when s2 => state <= s3;
					when s3 => state <= s4;
					when s4 => state <= s5;
					when s5 => state <= s6;
					when s6 => state <= s7;
					when s7 => state <= s8;
					when s8 => state <= s9;
					when s9 => state <= s10;
					when s10 => state <= s1;
end beh;