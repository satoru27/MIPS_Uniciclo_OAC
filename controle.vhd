library	ieee;
use	ieee.std_logic_1164.all;	
use	ieee.numeric_std.all;

entity	controle	is
	port	(
	opcode	 :	in	std_logic_vector(5	downto	0);
	funct	 	 :	in	std_logic_vector(5	downto	0);
	regdst	 :	out	std_logic;
	jump	 	 :	out	std_logic;
	branch	 :	out	std_logic;
	memread	 :	out	std_logic;
	memtoreg	 :	out	std_logic;
	aluop	 	 :	out	std_logic_vector(1 downto 0);
	memwrite	 :	out	std_logic;
	alusrc	 :	out	std_logic;
	regwrite	 :	out	std_logic;
	shamt	 	 :	out	std_logic;
	bne	 	 :	out	std_logic
	);
end	entity;

architecture	behavioral	of	controle	is
	begin
	proc_controle:	process	(opcode,funct)

	begin

			case	opcode	is	
				when	"000000"	=>	
							if (funct = "000000") or (funct = "000010") or (funct = "000011") then --shamt
								regdst <= '1';
								jump <= '0';
								branch <= '0';
								memread <= '0';
								memtoreg <= '0';
								aluop <= "10";
								memwrite <= '0';
								alusrc <= '0';
								regwrite <= '1';
								shamt <= '1';
								bne <= '0';
			
							else
								regdst <= '1';
								jump <= '0';
								branch <= '0';
								memread <= '0';
								memtoreg <= '0';
								aluop <= "10";
								memwrite <= '0';
								alusrc <= '0';
								regwrite <= '1';
								shamt <= '0';
								bne <= '0';
								
							end if;
				when	"001000"	=>	--addi
							regdst <= '0';
							jump <= '0';
							branch <= '0';
							memread <= '0';
							memtoreg <= '0';
							aluop <= "00";
							memwrite <= '0';
							alusrc <= '1';
							regwrite <= '1';
							shamt <= '0';
							bne <= '0';
				
				when	"100011"	=>	--lw
							regdst <= '0';
							jump <= '0';
							branch <= '0';
							memread <= '1';
							memtoreg <= '1';
							aluop <= "00";
							memwrite <= '0';
							alusrc <= '1';
							regwrite <= '1';				
							shamt <= '0';
							bne <= '0';
							
				when	"101011"	=> --sw	
							regdst <= '0';
							jump <= '0';
							branch <= '0';
							memread <= '0';
							memtoreg <= '0';
							aluop <= "00";
							memwrite <= '1';
							alusrc <= '1';
							regwrite <= '0';							
							shamt <= '0';
							bne <= '0';
							
				when	"000100"	=> --beq	
							regdst <= '0';
							jump <= '0';
							branch <= '1';
							memread <= '0';
							memtoreg <= '0';
							aluop <= "01";
							memwrite <= '0';
							alusrc <= '0';
							regwrite <= '0';							
							shamt <= '0';
							bne <= '0';
							
				when	"000101"	=> --bne	
							regdst <= '0';
							jump <= '0';
							branch <= '1';
							memread <= '0';
							memtoreg <= '0';
							aluop <= "01";
							memwrite <= '0';
							alusrc <= '0';
							regwrite <= '0';
							shamt <= '0';
							bne <= '1';
							
				when	"000010"	=> --jump	
							regdst <= '0';
							jump <= '1';
							branch <= '0';
							memread <= '0';
							memtoreg <= '0';
							aluop <= "00";
							memwrite <= '0';
							alusrc <= '0';
							regwrite <= '0';
							shamt <= '0';
							bne <= '0';
							
				when	others		=>
							regdst <= 'X';
							jump <= 'X';
							branch <= 'X';
							memread <= 'X';
							memtoreg <= 'X';
							aluop <= (others	=>	'X');
							memwrite <= 'X';
							alusrc <= 'X';
							regwrite <= 'X';
							shamt <= 'X';
							bne <= 'X';	
			end	case;

	end	process;

end	architecture	behavioral;