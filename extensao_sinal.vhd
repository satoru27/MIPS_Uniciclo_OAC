library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.numeric_std.all;

entity	extensao_sinal	is
	port	
	(
		extensao_in  :	in	 std_logic_vector(15	downto	0);
		extensao_out :	out	std_logic_vector(31	downto	0)
);
end	entity;

architecture	behavioral	of	extensao_sinal	is 

begin

	shift: process	(extensao_in)
	begin	
	
	if(extensao_in(15) = '1') then
	extensao_out <= "1111111111111111" & extensao_in;
	else
	extensao_out <= "0000000000000000" & extensao_in;
	end if;
	
	end	process;
end	architecture	behavioral;