library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.numeric_std.all;

entity	mux_ula	is
	generic	(	WSIZE	:	natural	:=	32;
			ISIZE	:	natural	:=	5;
			BREGSIZE	:	natural	:=	32	);
	port	
	(
		ALUSrc :	in	 	std_logic_vector(1	downto	0);
		mux_in_B	 :	in	std_logic_vector(WSIZE-1	downto	0);
		mux_in_I	 :	in	std_logic_vector(WSIZE-1	downto	0);
		mux_in_shamt	 :	in	std_logic_vector(WSIZE-1	downto	0);
		mux_out	 :	out	std_logic_vector(WSIZE-1	downto	0)
);
end	entity;

architecture	behavioral	of	mux_ula	is 
begin
	mux_proc: process	(ALUSrc,mux_in_B,mux_in_I,mux_in_shamt)
	
	begin
	
	case ALUSrc is
		when	"00"	=>	mux_out	<=	mux_in_B;
		when	"01"	=>	mux_out	<=	mux_in_I;
		when	"10"	=>	mux_out	<=	mux_in_shamt;
		when	others	=>	mux_out	<=	(others	=>	'X');	
	end	case;
	
	
	
	end	process;
end	architecture	behavioral;