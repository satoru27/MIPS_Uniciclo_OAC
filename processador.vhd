library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.numeric_std.all;

entity	processador	is
	port	
	(	
		clk : in std_logic;
		clk_mem: in std_logic;
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
	
	
	
	reg1 : out	std_logic_vector(4	downto	0);
	reg2 : out	std_logic_vector(4	downto	0);
	wreg : out	std_logic_vector(4	downto	0);
	entrA: out	std_logic_vector(31	downto	0);
	entrB: out	std_logic_vector(31	downto	0);
	
	branch_endereco: out	std_logic_vector(31	downto	0)
		
);


end processador;


architecture	behavioral	of	processador	is

component pc_reg IS
	PORT
	(
		clock		: IN STD_LOGIC ;
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		load		: IN STD_LOGIC := '1';
		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
end component;


component memoria_instrucao IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0) := "00000000000000000000000000000000";
		wren		: IN STD_LOGIC := '0';
		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END component;


component	somador_PC_4	is
	port	
	(
		pc_in :	in	 std_logic_vector(31	downto	0);
		pc_mais_4	 :	out	std_logic_vector(31	downto	0)
);
end	component;

----------------
component	controle	is
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
end	component;

--------------
component	shift_jump	is
	port	
	(
		jump_in :	in	 std_logic_vector(25	downto	0);
		pc_mais_4 :	in	 std_logic_vector(3	downto	0);
		jump_address	 :	out	std_logic_vector(31	downto	0)
);
end	component;

component	mux_jump	is
	port	
	(
		Jump :	in	 	std_logic;
		mux_in_branch_pc	 :	in	std_logic_vector(31	downto	0);
		mux_in_jump	 :	in	std_logic_vector(31	downto	0);
		mux_out	 :	out	std_logic_vector(31	downto	0)
);
end component;


------------------

component	mux_w_reg	is
	port	
	(
		RegDst :	in	 	std_logic;
		mux_in_I	 :	in	std_logic_vector(4	downto	0);
		mux_in_R	 :	in	std_logic_vector(4	downto	0);
		mux_out	 :	out	std_logic_vector(4	downto	0)
);
end	component;

component	breg	is
	generic	(	WSIZE	:	natural	:=	32;
			ISIZE	:	natural	:=	5;
			BREGSIZE	:	natural	:=	32	);
	port	
	(
		clk :	in		std_logic;
		we :	in		std_logic;
		rs :	in	 	std_logic_vector(ISIZE-1	downto	0);
		rt :	in	 	std_logic_vector(ISIZE-1	downto	0);
		rd :	in	 	std_logic_vector(ISIZE-1	downto	0);
		d_in :	in		std_logic_vector(WSIZE-1	downto	0);
		regA	 :	out	std_logic_vector(WSIZE-1	downto	0);
		regB	 :	out	std_logic_vector(WSIZE-1	downto	0)
);
end	component;

component	extensao_sinal	is
	port	
	(
		extensao_in  :	in	 std_logic_vector(15	downto	0);
		extensao_out :	out	std_logic_vector(31	downto	0)
);
end	component;


component	mux_ula_B	is
	generic	(	WSIZE	:	natural	:=	32;
			ISIZE	:	natural	:=	5;
			BREGSIZE	:	natural	:=	32	);
	port	
	(
		ALUSrc :	in	 	std_logic;
		mux_in_B	 :	in	std_logic_vector(WSIZE-1	downto	0);
		mux_in_I	 :	in	std_logic_vector(WSIZE-1	downto	0);
		mux_out	 :	out	std_logic_vector(WSIZE-1	downto	0)
);
end	component;

component	mux_ula_A	is
	generic	(	WSIZE	:	natural	:=	32;
			ISIZE	:	natural	:=	5;
			BREGSIZE	:	natural	:=	32	);
	port	
	(
		Shamt :	in	 	std_logic;
		mux_in_A	 :	in	std_logic_vector(WSIZE-1	downto	0);
		mux_in_shamt	 :	in	std_logic_vector(4	downto	0);
		mux_out	 :	out	std_logic_vector(WSIZE-1	downto	0)
);
end	component;


component	c_ula	is
	port	(
	func	 :	in	std_logic_vector(5	downto	0);
	opUla :	in	std_logic_vector(1	downto	0);
	ctrula	 :	out	std_logic_vector(3	downto	0)
	);
end	component;


component	ula	is
	generic	(	WSIZE	:	natural	:=	32);
	port	(	
		ulop :	in	std_logic_vector(3	downto	0);
		A,	B :	in	std_logic_vector(WSIZE-1	downto	0);	
		aluout:	out	std_logic_vector(WSIZE-1	downto	0);	
		zero :	out	std_logic	
		);
end	component;

----------------------------------------
component	somador_branch	is
	port	
	(
		pc_mais_4 :	in	 std_logic_vector(31	downto	0);
		extensao_offset :	in	 std_logic_vector(31	downto	0);
		branch_address	 :	out	std_logic_vector(31	downto	0)
);
end	component;

component	mux_branch	is
	port	
	(
		Branch :	in	 	std_logic;
		mux_bne :	in	 	std_logic;
		mux_in_branch	 :	in	std_logic_vector(31	downto	0);
		mux_in_pc_4	 :	in	std_logic_vector(31	downto	0);
		mux_out	 :	out	std_logic_vector(31	downto	0)
);
end	component;

component	mux_bne	is
	port	
	(
		bne :	in	 	std_logic;
		zero	 :	in	std_logic;
		mux_out	 :	out	std_logic
);
end	component;
--------------------------------------------

component memoria_dados IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END component;

component	mux_wb	is
	port	
	(
		MemtoReg :	in	 	std_logic;
		mux_in_ula	 :	in	std_logic_vector(31	downto	0);
		mux_in_mem	 :	in	std_logic_vector(31	downto	0);
		mux_out	 :	out	std_logic_vector(31	downto	0)
);
end	component;




--signals
--
signal pc_in_tmp	 : std_logic_vector(31	downto	0):= (others => '0');
signal pc_out_tmp		 : std_logic_vector(31	downto	0):= (others => '0');
signal t_pc_mais_4		 : std_logic_vector(31	downto	0):= (others => '0');
signal q_tmp 	 : std_logic_vector(31	downto	0):= (others => '0');
--
signal instruction	 :	std_logic_vector(31	downto	0);
--
signal 	tregdst	 :		std_logic;
signal 	tjump	 	 :		std_logic;
signal 	tbranch	 :		std_logic;
signal 	tmemread	 :		std_logic;
signal 	tmemtoreg	 :		std_logic;
signal 	taluop	 	 :		std_logic_vector(1 downto 0);
signal 	tmemwrite	 :		std_logic;
signal 	talusrc	 :		std_logic;
signal 	tregwrite	 :		std_logic;
signal 	tshamt	 	 :		std_logic;
signal 	tbne	 	 :		std_logic;
--
signal end_jump	 :	std_logic_vector(31	downto	0);

---------------
signal wr_reg 	 : std_logic_vector(4	downto	0):= (others => '0');
signal from_breg_A :std_logic_vector(31	downto	0):= (others => '0');
signal from_breg_B :std_logic_vector(31	downto	0):= (others => '0');
signal ext_temp :std_logic_vector(31	downto	0):= (others => '0');
signal ula_B :std_logic_vector(31	downto	0):= (others => '0');
signal ula_A :std_logic_vector(31	downto	0):= (others => '0');

---------------------
signal ulaop_contr	 :	std_logic_vector(3	downto	0);
signal resul_ula	 :	std_logic_vector(31	downto	0);
signal tzero	 :	std_logic;


--------------------------------
signal end_branch	 :	std_logic_vector(31	downto	0);
signal mux_bne_sig	 :	std_logic;
signal mux_branch_out : std_logic_vector(31	downto	0);

-------------
signal write_data :std_logic_vector(31	downto	0):= (others => '0');
signal saida_mem_dados :std_logic_vector(31	downto	0):= (others => '0');


begin


-- port maps
pc_pm: pc_reg port map(
		clock	=> clk,
		data	=> pc_in_tmp,
		q	=> pc_out_tmp
		);
		
mi_pm: memoria_instrucao port map(
		address	=> pc_out_tmp(9 downto 2),
		clock		=> clk_mem,
		q	=> instruction
);

pc4_pm: somador_PC_4 port map(
		pc_in => pc_out_tmp,
		pc_mais_4 => t_pc_mais_4
);

---------------------------------------------------------------------
con_pm: controle port	map(
	opcode	 => instruction(31 downto 26),
	funct	 	 => instruction(5 downto 0),
	regdst	 =>tregdst,
	jump	 	 =>tjump,
	branch	 =>tbranch,
	memread	 =>tmemread,
	memtoreg	 =>tmemtoreg,
	aluop	 	 =>taluop,
	memwrite	 =>tmemwrite,
	alusrc	 =>talusrc,
	regwrite	 =>tregwrite,
	shamt	 	 =>tshamt,
	bne	 	 =>tbne
	);


	
---------------------------------------------------------------------
sj_pm: shift_jump port map	
	(
		jump_in => instruction(25 downto 0),
		pc_mais_4 =>	t_pc_mais_4(31 downto 28),
		jump_address	 =>	end_jump
);


mj_pm:	mux_jump	port map	
	(
		Jump => tjump,
		mux_in_branch_pc	 => mux_branch_out, 
		mux_in_jump	 => end_jump,
		mux_out	 => pc_in_tmp
);
	
---------------------------------------------------------------------



mw_pm:	mux_w_reg port	map
	(
		RegDst => tregdst,
		mux_in_I	 => instruction(20 downto 16),
		mux_in_R	 => instruction(15 downto 11),
		mux_out	 => wr_reg
);

reg_pm:	breg	port map	
	(
		clk =>clk,
		we =>tregwrite,
		rs =>instruction(25 downto 21),
		rt =>instruction(20 downto 16),
		rd =>wr_reg,
		d_in =>write_data,
		regA	 =>from_breg_A,
		regB	 =>from_breg_B
);

exts_pm:	extensao_sinal	 port	map
	(
		extensao_in  =>instruction(15 downto 0),
		extensao_out =>ext_temp
);


mB_pm:	mux_ula_B	port map	
	(
		ALUSrc =>talusrc,
		mux_in_B	 =>from_breg_B,
		mux_in_I	 =>ext_temp,
		mux_out	 =>ula_B
);


mA_pm: mux_ula_A port map	
	(
		Shamt =>tshamt,
		mux_in_A	 =>from_breg_A,
		mux_in_shamt =>instruction(10 downto 6),
		mux_out	 =>ula_A
);



-------------------------------------------------------------------------

cula_pm:	c_ula	port	map(
	func	 => instruction(5 downto 0),
	opUla =>taluop,
	ctrula	 =>ulaop_contr
	);



ula_pm:	ula	port map	(	
		ulop =>ulaop_contr,
		A =>ula_A,	
		B =>ula_B,
		aluout =>resul_ula,
		zero =>tzero
		);


---------------------------------------------------------------------------

sb_pm:	somador_branch	port map	
	(
		pc_mais_4 => t_pc_mais_4,
		extensao_offset => ext_temp,
		branch_address	 => end_branch
);

mbne_pm: mux_bne	port	map
	(
		bne => tbne,
		zero	 => tzero,
		mux_out	 => mux_bne_sig
);


muxbranch_pm:	mux_branch	port map	
	(
		Branch =>tbranch,
		mux_bne => mux_bne_sig,
		mux_in_branch	 => end_branch,
		mux_in_pc_4	 =>t_pc_mais_4,
		mux_out	 => mux_branch_out
);

-------------------------------------------------

mdados_pm: memoria_dados PORT map
	(
		address		=>resul_ula(9 downto 2),
		clock		=>clk_mem,
		data		=> from_breg_B,
		wren		=>tmemwrite,
		q		=> saida_mem_dados
	);


mwb_pm:	mux_wb	port map	
	(
		MemtoReg	=>tmemtoreg,
		mux_in_ula	 =>resul_ula,
		mux_in_mem	 =>saida_mem_dados,
		mux_out	 => write_data
);








	
	
	--fim port maps
	instrucao <= instruction;
	
	regdst	 <=tregdst;
	jump	 	 <=tjump;
	branch	 <=tbranch;
	memread	 <=tmemread;
	memtoreg	 <=tmemtoreg;
	aluop	 	 <=taluop;
	memwrite	 <=tmemwrite;
	alusrc	 <=talusrc;
	regwrite	 <=tregwrite;
	shamt	 	 <=tshamt;
	bne	 	 <=tbne;
	
	prox_ins <= t_pc_mais_4;

	
	
	reg1 <= instruction(25 downto 21);
	reg2 <= instruction(20 downto 16);
	wreg <= wr_reg;
	entrA <= ula_A;
	entrB <= ula_B;
	
	
	branch_endereco <=end_branch;

end	architecture	behavioral;