LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY processador_uniciclo_tb IS
END processador_uniciclo_tb;

ARCHITECTURE processador_uniciclo_arch OF processador_uniciclo_tb IS

-- signals
		signal clk : std_logic := '0';
		signal clk_mem: std_logic := '0';
		constant clk_period: time := 20ns;
  signal	pc4	 :	std_logic_vector(31	downto	0);
	signal	instrucao	 :	std_logic_vector(31	downto	0);
	signal		regdst	 :	std_logic;
	signal jump	 	 :	std_logic;
	signal branch	 :	std_logic;
	signal memread	 :		std_logic;
	signal memtoreg	 :		std_logic;
	signal aluop	 	 :	std_logic_vector(1 downto 0);
	signal memwrite	 :		std_logic;
	signal alusrc	 :		std_logic;
	signal regwrite	 :		std_logic;
	signal shamt	 	 :		std_logic;
	signal bne	 	 :		std_logic;
	
	signal reg1: 	std_logic_vector(4	downto	0);
	signal reg2: 	std_logic_vector(4	downto	0);
	signal wreg: 	std_logic_vector(4	downto	0);
	signal entrA: 	std_logic_vector(31	downto	0);
	signal entrB:	std_logic_vector(31	downto	0);
	signal branch_endereco:	std_logic_vector(31	downto	0);
	
		
component processador	is
	port	
	(	
		clk : in std_logic := '0';
		clk_mem: in std_logic := '0';
		instrucao	 :out	std_logic_vector(31	downto	0);
		prox_ins: out	std_logic_vector(31	downto	0);
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
	bne	 	 :	out	std_logic;
	
	reg1: out	std_logic_vector(4	downto	0);
	reg2: out	std_logic_vector(4	downto	0);
	wreg: out	std_logic_vector(4	downto	0);
	entrA: out	std_logic_vector(31	downto	0);
	entrB: out	std_logic_vector(31	downto	0);
	
	branch_endereco: out	std_logic_vector(31	downto	0)

);
end component;


BEGIN
p1 : processador PORT MAP (
clk=>clk,
clk_mem=>clk_mem,

instrucao => instrucao,

	regdst	 =>regdst,
	jump	 	 =>jump,
	branch	 =>branch,
	memread	 =>memread,
	memtoreg	 =>memtoreg,
	aluop	 	 =>aluop,
	memwrite	 =>memwrite,
	alusrc	 =>alusrc,
	regwrite	 =>regwrite,
	shamt	 	 =>shamt,
	bne	 	 =>bne,
	
	prox_ins => pc4,
	
	reg1 => reg1,
	reg2 => reg2,
	wreg => wreg,
	entrA => entrA,
	entrB => entrB,
	
	branch_endereco =>branch_endereco
);

clock : PROCESS(clk)

BEGIN

	clk <= not clk after clk_period/2;  

	
END PROCESS clock;

clock_mem : PROCESS(clk_mem)

BEGIN

	clk_mem <= not clk_mem after clk_period/20;

	
END PROCESS clock_mem;


END processador_uniciclo_arch;

