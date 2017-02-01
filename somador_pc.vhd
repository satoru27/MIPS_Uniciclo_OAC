library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.numeric_std.all;

entity	somador_PC_4	is
	port	
	(
		pc_in :	in	 std_logic_vector(31	downto	0);
		pc_mais_4	 :	out	std_logic_vector(31	downto	0)
);
end	entity;

architecture	behavioral	of	somador_PC_4	is 
begin
	pc_4: process	(pc_in)
	begin	
	
	pc_mais_4 <= std_logic_vector(unsigned(pc_in) + 4);
	
	end	process;
end	architecture	behavioral;