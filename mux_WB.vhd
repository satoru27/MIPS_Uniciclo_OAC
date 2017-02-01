library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.numeric_std.all;

entity	mux_wb	is
	port	
	(
		MemtoReg :	in	 	std_logic;
		mux_in_ula	 :	in	std_logic_vector(31	downto	0);
		mux_in_mem	 :	in	std_logic_vector(31	downto	0);
		mux_out	 :	out	std_logic_vector(31	downto	0)
);
end	entity;

architecture	behavioral	of	mux_wb	is 
begin
	mux_proc: process	(MemtoReg,mux_in_ula,mux_in_mem)
	
	begin
	
	case MemtoReg is
		when	'0'	=>	mux_out	<=	mux_in_ula;
		when	'1'	=>	mux_out	<=	mux_in_mem;
		when	others	=>	mux_out	<=	(others	=>	'X');	
	end	case;
	
	
	
	end	process;
end	architecture	behavioral;