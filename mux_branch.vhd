library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.numeric_std.all;

entity	mux_branch	is
	port	
	(
		Branch :	in	 	std_logic;
		mux_bne :	in	 	std_logic;
		mux_in_branch	 :	in	std_logic_vector(31	downto	0);
		mux_in_pc_4	 :	in	std_logic_vector(31	downto	0);
		mux_out	 :	out	std_logic_vector(31	downto	0)
);
end	entity;

architecture	behavioral	of	mux_branch	is 

signal mux_select: std_logic;

begin
	mux_proc: process	(Branch,mux_bne,mux_in_branch,mux_in_pc_4,mux_select)
	
	begin
	
	mux_select <= Branch and mux_bne;
	
	case mux_select is
		when	'0'	=>	mux_out	<=	mux_in_pc_4;
		when	'1'	=>	mux_out	<=	mux_in_branch;
		when	others	=>	mux_out	<=	(others	=>	'X');	
	end	case;
	
	
	
	end	process;
end	architecture	behavioral;