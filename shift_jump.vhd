library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.numeric_std.all;

entity	shift_jump	is
	port	
	(
		jump_in :	in	 std_logic_vector(25	downto	0);
		pc_mais_4 :	in	 std_logic_vector(3	downto	0);
		jump_address	 :	out	std_logic_vector(31	downto	0)
);
end	entity;

architecture	behavioral	of	shift_jump	is 

signal	tmp_pc	:	std_logic_vector(31	downto	0);
signal	tmp_j	:	std_logic_vector(31	downto	0);

begin

	shift: process	(jump_in,pc_mais_4)
	begin	
	
	tmp_pc <= (31 =>pc_mais_4(3),
				  30 =>pc_mais_4(2),
				  29 =>pc_mais_4(1),
				  28 =>pc_mais_4(0),
				  others => '0');
				  
	tmp_j <= "000000" & jump_in;
	
	tmp_j<=std_logic_vector(shift_left(unsigned(tmp_j), 2));
	
	jump_address <= tmp_pc and tmp_j;
	
	end	process;
end	architecture	behavioral;