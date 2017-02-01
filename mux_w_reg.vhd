library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.numeric_std.all;

entity	mux_w_reg	is
	port	
	(
		RegDst :	in	 	std_logic;
		mux_in_I	 :	in	std_logic_vector(4	downto	0);
		mux_in_R	 :	in	std_logic_vector(4	downto	0);
		mux_out	 :	out	std_logic_vector(4	downto	0)
);
end	entity;

architecture	behavioral	of	mux_w_reg	is 
begin
	mux_proc: process	(RegDst,mux_in_I,mux_in_R)
	
	begin
	
	case RegDst is
		when	'0'	=>	mux_out	<=	mux_in_I;
		when	'1'	=>	mux_out	<=	mux_in_R;
		when	others	=>	mux_out	<=	(others	=>	'X');	
	end	case;
	
	
	
	end	process;
end	architecture	behavioral;