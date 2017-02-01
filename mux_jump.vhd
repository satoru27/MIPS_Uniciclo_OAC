library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.numeric_std.all;

entity	mux_jump	is
	port	
	(
		Jump :	in	 	std_logic;
		mux_in_branch_pc	 :	in	std_logic_vector(31	downto	0);
		mux_in_jump	 :	in	std_logic_vector(31	downto	0);
		mux_out	 :	out	std_logic_vector(31	downto	0)
);
end	entity;

architecture	behavioral	of	mux_jump	is 
begin
	mux_proc: process	(Jump,mux_in_branch_pc,mux_in_jump)
	
	begin
	
	case Jump is
		when	'0'	=>	mux_out	<=	mux_in_branch_pc;
		when	'1'	=>	mux_out	<=	mux_in_jump;
		when	others	=>	mux_out	<=	(others	=>	'X');	
	end	case;
	
	
	
	end	process;
end	architecture	behavioral;