library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.numeric_std.all;

entity	mux_ula_B	is
	generic	(	WSIZE	:	natural	:=	32;
			ISIZE	:	natural	:=	5;
			BREGSIZE	:	natural	:=	32	);
	port	
	(
		ALUSrc :	in	 	std_logic;
		mux_in_B	 :	in	std_logic_vector(WSIZE-1	downto	0);
		mux_in_I	 :	in	std_logic_vector(WSIZE-1	downto	0);
		mux_out	 :	out	std_logic_vector(WSIZE-1	downto	0)
);
end	entity;

architecture	behavioral	of	mux_ula_B	is 
begin
	mux_proc: process	(ALUSrc,mux_in_B,mux_in_I)
	
	begin
	
	case ALUSrc is
		when	'0'	=>	mux_out	<=	mux_in_B;
		when	'1'	=>	mux_out	<=	mux_in_I;
		when	others	=>	mux_out	<=	(others	=>	'X');	
	end	case;
	
	
	
	end	process;
end	architecture	behavioral;