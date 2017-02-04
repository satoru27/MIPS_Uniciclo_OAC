LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY teste_tb IS
END teste_tb;

ARCHITECTURE teste_arch OF teste_tb IS

signal teste_in : std_logic_vector(31 downto 0);
signal tmp : std_logic_vector(31 downto 0);
constant clk_period: time := 20ns;
signal out_teste	 :		std_logic_vector(31	downto	0);
signal clk :		std_logic:='0';


signal pc_in : std_logic_vector(31 downto 0);

component	shift_jump	is
	port	
	(
		jump_in :	in	 std_logic_vector(25	downto	0);
		pc_mais_4 :	in	 std_logic_vector(3	downto	0);
		jump_address	 :	out	std_logic_vector(31	downto	0)
);
end	component;


begin
pm: shift_jump port map(
jump_in => teste_in,
pc_mais_4 => pc_in,
jump_address=> out_teste);



clock : PROCESS(clk)

BEGIN

	clk <= not clk after clk_period/2;  

	
END PROCESS clock;
		
teste : PROCESS

BEGIN

	pc_in <= x"00000040"; 
	teste_in <=x"08000015";
	wait for 19ns;	
	
END PROCESS teste;

END teste_arch;

