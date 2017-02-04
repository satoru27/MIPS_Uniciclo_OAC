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
	
	signal reg_1: 	std_logic_vector(4	downto	0);
	signal reg_2: 	std_logic_vector(4	downto	0);
	signal wreg: 	std_logic_vector(4	downto	0);
	signal entrA: 	std_logic_vector(31	downto	0);
	signal entrB:	std_logic_vector(31	downto	0);
	signal branch_endereco:	std_logic_vector(31	downto	0);
	
signal 	sreg0	 :		std_logic_vector(31	downto	0);
signal 	sreg1	 :		std_logic_vector(31	downto	0);
signal 	sreg2	 :		std_logic_vector(31	downto	0);
signal 		sreg3	 :		std_logic_vector(31	downto	0);
signal 		sreg4	 :		std_logic_vector(31	downto	0);
signal 		sreg5	 :		std_logic_vector(31	downto	0);
signal 		sreg6	 :		std_logic_vector(31	downto	0);
signal 		sreg7	 :		std_logic_vector(31	downto	0);
signal 		sreg8	 :		std_logic_vector(31	downto	0);
signal 		sreg9	 :		std_logic_vector(31	downto	0);
signal 		sreg10	 :		std_logic_vector(31	downto	0);
signal 		sreg11	 :		std_logic_vector(31	downto	0);
signal 		sreg12	 :		std_logic_vector(31	downto	0);
signal 		sreg13	 :		std_logic_vector(31	downto	0);
signal 		sreg14	 :		std_logic_vector(31	downto	0);
signal 		sreg15	 :		std_logic_vector(31	downto	0);
signal 		sreg16	 :		std_logic_vector(31	downto	0);
signal 		sreg17	 :		std_logic_vector(31	downto	0);
signal 		sreg18	 :		std_logic_vector(31	downto	0);
signal 		sreg19	 :		std_logic_vector(31	downto	0);
signal 		sreg20	 :		std_logic_vector(31	downto	0);
signal 		sreg21	 :		std_logic_vector(31	downto	0);
signal 		sreg22	 :		std_logic_vector(31	downto	0);
signal 		sreg23	 :		std_logic_vector(31	downto	0);
signal 		sreg24	 :		std_logic_vector(31	downto	0);
signal 		sreg25	 :		std_logic_vector(31	downto	0);
signal 		sreg26	 :		std_logic_vector(31	downto	0);
signal 		sreg27	 :		std_logic_vector(31	downto	0);
signal 		sreg28	 :		std_logic_vector(31	downto	0);
signal 		sreg29	 :		std_logic_vector(31	downto	0);
signal 		sreg30	 :		std_logic_vector(31	downto	0);
signal 		sreg31	 :		std_logic_vector(31	downto	0);

	
		
component processador	is
	generic	(WSIZE	:	natural	:=	32);
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
	
	reg_1: out	std_logic_vector(4	downto	0);
	reg_2: out	std_logic_vector(4	downto	0);
	wreg: out	std_logic_vector(4	downto	0);
	entrA: out	std_logic_vector(31	downto	0);
	entrB: out	std_logic_vector(31	downto	0);
	
	branch_endereco: out	std_logic_vector(31	downto	0);
	
		sreg0	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg1	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg2	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg3	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg4	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg5	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg6	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg7	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg8	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg9	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg10	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg11	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg12	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg13	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg14	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg15	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg16	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg17	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg18	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg19	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg20	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg21	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg22	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg23	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg24	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg25	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg26	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg27	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg28	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg29	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg30	 :	out	std_logic_vector(WSIZE-1	downto	0);
		sreg31	 :	out	std_logic_vector(WSIZE-1	downto	0)

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
	
	reg_1 => reg_1,
	reg_2 => reg_2,
	wreg => wreg,
	entrA => entrA,
	entrB => entrB,
	
	branch_endereco =>branch_endereco,
	
		sreg0	 =>sreg0,
		sreg1	 =>sreg1,
		sreg2	 =>sreg2,
		sreg3	 =>sreg3,
		sreg4	 =>sreg4,
		sreg5	 =>sreg5,
		sreg6	 =>sreg6,
		sreg7	 =>sreg7,
		sreg8	 =>sreg8,
		sreg9	 =>sreg9,
		sreg10	 =>sreg10,
		sreg11	 =>sreg11,
		sreg12	 =>sreg12,
		sreg13	 =>sreg13,
		sreg14	 =>sreg14,
		sreg15	 =>sreg15,
		sreg16	 =>sreg16,
		sreg17	 =>sreg17,
		sreg18	 =>sreg18,
		sreg19	 =>sreg19,
		sreg20	 =>sreg20,
		sreg21	 =>sreg21,
		sreg22	 =>sreg22,
		sreg23	 =>sreg23,
		sreg24	 =>sreg24,
		sreg25	 =>sreg25,
		sreg26	 =>sreg26,
		sreg27	 =>sreg27,
		sreg28	 =>sreg28,
		sreg29	 =>sreg29,
		sreg30	 =>sreg30,
		sreg31	 =>sreg31
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

