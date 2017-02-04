library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.numeric_std.all;

entity	mux_ula_A	is
	generic	(	WSIZE	:	natural	:=	32;
			ISIZE	:	natural	:=	5;
			BREGSIZE	:	natural	:=	32	);
	port	
	(
		Shamt :	in	 	std_logic;
		mux_in_A	 :	in	std_logic_vector(WSIZE-1	downto	0);
		mux_in_shamt	 :	in	std_logic_vector(4	downto	0);
		mux_out	 :	out	std_logic_vector(WSIZE-1	downto	0)
);
end	entity;

architecture	behavioral	of	mux_ula_A	is 

signal shamt_ext : std_logic_vector(31	downto	0):= (others => '0');

begin
	mux_proc: process	(Shamt,mux_in_A,mux_in_shamt,shamt_ext)
	
	begin
	
	if(mux_in_shamt(4) = '1') then
	shamt_ext <= "111111111111111111111111111" & mux_in_shamt;
	else
	shamt_ext <= "000000000000000000000000000" & mux_in_shamt;
	end if;
	
	case Shamt is
		when	'0'	=>	mux_out	<=	mux_in_A;
		when	'1'	=>	mux_out	<=	shamt_ext;
		when	others	=>	mux_out	<=	(others	=>	'X');	
	end	case;
	
	
	
	end	process;
end	architecture	behavioral;