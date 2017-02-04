library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.numeric_std.all;

entity	somador_branch	is
	port	
	(
		pc_mais_4 :	in	 std_logic_vector(31	downto	0);
		extensao_offset :	in	 std_logic_vector(31	downto	0);
		branch_address	 :	out	std_logic_vector(31	downto	0)
);
end	entity;

architecture	behavioral	of	somador_branch	is 

signal tmp: std_logic_vector(31	downto	0);

begin
	branch: process	(pc_mais_4,extensao_offset,tmp)
	begin	
	
	tmp<=std_logic_vector(shift_left(signed(extensao_offset), 2));
	
	--evitar possiveis problemas de sinal em um endereco longo?
	if (extensao_offset(31) = '1') then
		branch_address <= std_logic_vector(unsigned(pc_mais_4) - unsigned(tmp));
	else
		branch_address <= std_logic_vector(unsigned(pc_mais_4) + unsigned(tmp));
	end if;
	
	end	process;
end	architecture	behavioral;