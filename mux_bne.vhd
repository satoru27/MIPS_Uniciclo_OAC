library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.numeric_std.all;

entity	mux_bne	is
	port	
	(
		bne :	in	 	std_logic;
		zero	 :	in	std_logic;
		mux_out	 :	out	std_logic
);
end	entity;

architecture	behavioral	of	mux_bne is 
begin
	mux_proc: process	(bne,zero)
	
	begin
	
	case bne is
		when	'0'	=>	mux_out	<=	zero;
		when	'1'	=>	mux_out	<=	not(zero);
		when	others	=>	mux_out	<=	'X';	
	end	case;
	
	
	
	end	process;
end	architecture	behavioral;