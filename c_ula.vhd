library	ieee;
use	ieee.std_logic_1164.all;	
use	ieee.numeric_std.all;
use	work.mips_pkg.all;

entity	c_ula	is
	port	(
	func	 :	in	std_logic_vector(5	downto	0);
	opUla :	in	std_logic_vector(1	downto	0);
	ctrula	 :	out	std_logic_vector(3	downto	0)
	);
end	c_ula;

architecture	behavioral	of	c_ula	is
	begin
	proc_c_ula:	process	(func,	opUla)

	begin
	        I1: if	(opUla	= "00") then	
			ctrula	<= ULA_ADD;
		
		elsif (opUla = "01") then
			ctrula <= ULA_SUB;
		
		elsif (opUla = "10") then

			case	func	is	
				when	"100000"	=>	ctrula	<=	ULA_ADD;
				when	"100010"	=>	ctrula	<=	ULA_SUB;
				when	"100101"	=>	ctrula	<=	ULA_OR;
				when	"100100"	=>	ctrula	<=	ULA_AND;
				when	"101010"	=>	ctrula	<=	ULA_SLT;
				when	"100111"	=>	ctrula	<=	ULA_NOR;
				when	"100110"	=>	ctrula	<=	ULA_XOR;
				when	"000000"	=>	ctrula	<=	ULA_SLL;
				when	"000010"	=>	ctrula	<=	ULA_SRL;
				when	"000011"	=>	ctrula	<=	ULA_SRA;
				when	others		=>	ctrula	<=	(others	=>	'X');	
			end	case;
		
		else
			ctrula <= "XXXX";
		
		end if I1;

	end	process;

end	architecture	behavioral;