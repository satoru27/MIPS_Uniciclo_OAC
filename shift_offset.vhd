library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.numeric_std.all;

entity	shift_offset is
	port	
	(
		offset_in :	in	 std_logic_vector(31	downto	0);
		offset_out	 :	out	std_logic_vector(31	downto	0)
);
end	entity;

architecture	behavioral	of	shift_offset	is 

begin

	shift: process	(offset_in)
	begin	
	
	offset_out <= std_logic_vector(shift_left(signed(offset_in), 2));
	
	end	process;
end	architecture	behavioral;