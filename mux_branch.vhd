library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.numeric_std.all;

entity	mux_branch	is
	port	
	(
		Branch :	in	 	std_logic;
		mux_in_branch	 :	in	std_logic_vector(31	downto	0);
		mux_in_pc_4	 :	in	std_logic_vector(31	downto	0);
		mux_out	 :	out	std_logic_vector(31	downto	0)
);
end	entity;

architecture	behavioral	of	mux_branch	is 
begin
	mux_proc: process	(Branch,mux_in_branch,mux_in_pc_4)
	
	begin
	
	case Branch is
		when	'0'	=>	mux_out	<=	mux_in_pc_4;
		when	'1'	=>	mux_out	<=	mux_in_branch;
		when	others	=>	mux_out	<=	(others	=>	'X');	
	end	case;
	
	
	
	end	process;
end	architecture	behavioral;