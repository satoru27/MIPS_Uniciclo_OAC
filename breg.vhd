library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.numeric_std.all;

entity	breg	is
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
		regB	 :	out	std_logic_vector(WSIZE-1	downto	0);
		
		--mostrar registradores
		reg0	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg1	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg2	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg3	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg4	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg5	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg6	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg7	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg8	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg9	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg10	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg11	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg12	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg13	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg14	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg15	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg16	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg17	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg18	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg19	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg20	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg21	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg22	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg23	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg24	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg25	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg26	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg27	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg28	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg29	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg30	 :	out	std_logic_vector(WSIZE-1	downto	0);
		reg31	 :	out	std_logic_vector(WSIZE-1	downto	0)
		
);
end	entity;

architecture	rtl	of	breg	is 
	constant ZERO32	 : std_logic_vector(WSIZE-1 downto 0) := (others => '0');
	type reg_array_t is array(natural range <>) of std_logic_vector(WSIZE-1	downto	0);
	signal	 breg:	 reg_array_t(BREGSIZE-1	 downto	 0)	 :=	 (others => (others	=>	'0'));
begin

	-- leitura	dos	registradores
	regA	 <=	 ZERO32	 when	 (rs	 =	 "00000")	 else	breg(to_integer(unsigned(rs)));
	regB	 <=	 ZERO32	 when	 (rt	 =	 "00000")	 else	breg(to_integer(unsigned(rt)));
	
	-- processo	de	escrita	de	um	registrador	do	banco
	process	(clk)
	begin
		if	(rising_edge(clk))	then
			if	(we	=	'1')	then
				breg(to_integer(unsigned(rd)))	<=	d_in;
			end	if;
		end	if;
	end	process;
	
	--mostrar todos os registradores
	process(breg)
	--		reg0,		reg1,		reg2,		reg3,		reg4	, 		reg5	, 		reg6	,
	--reg7	, 		reg8	 ,		reg9	 ,		reg10	 ,		reg11	 ,		reg12	 ,		reg13	 ,
	--reg14	 ,		reg15	 ,reg16	 ,reg17	 ,reg18	 ,reg19	 ,reg20	 ,reg21	 ,reg22	
	--,reg23	 ,reg24	 ,reg25	 ,reg26	 ,reg27	 ,reg28	 ,reg29	 ,reg30	 ,reg31	 
	begin
		reg0	 <=breg(0);
		reg1	 <=breg(1);
		reg2	 <=breg(2);
		reg3	 <=breg(3);
		reg4	 <=breg(4);
		reg5	 <=breg(5);
		reg6	 <=breg(6);
		reg7	 <=breg(7);
		reg8	 <=breg(8);
		reg9	 <=breg(9);
		reg10	 <=breg(10);
		reg11	 <=breg(11);
		reg12	 <=breg(12);
		reg13	 <=breg(13);
		reg14	 <=breg(14);
		reg15	 <=breg(15);
		reg16	 <=breg(16);
		reg17	 <=breg(17);
		reg18	 <=breg(18);
		reg19	 <=breg(19);
		reg20	 <=breg(20);
		reg21	 <=breg(21);
		reg22	 <=breg(22);
		reg23	 <=breg(23);
		reg24	 <=breg(24);
		reg25	 <=breg(25);
		reg26	 <=breg(26);
		reg27	 <=breg(27);
		reg28	 <=breg(28);
		reg29	 <=breg(29);
		reg30	 <=breg(30);
		reg31	 <=breg(31);
		
	end process;
end	rtl;