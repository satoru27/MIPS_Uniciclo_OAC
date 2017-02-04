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

--signal	tmp_pc	:	std_logic_vector(31	downto	0);
--signal	tmp_j	:	std_logic_vector(31	downto	0);

begin

	shift: process	(jump_in,pc_mais_4)
	begin	
	
	--tmp_pc <= pc_mais_4 & x"0000000"
				  
	--tmp_j <= "0000" & jump_in & "00";			  
	--tmp_j <= pc_mais_4 & jump_in & "00";
	
	--tmp_j<=std_logic_vector(shift_left(unsigned(tmp_j), 2));
	
	--jump_address <= tmp_pc or tmp_j;
	jump_address <= pc_mais_4 & jump_in & "00";
	
	end	process;
end	architecture	behavioral;