library	ieee;
use	ieee.std_logic_1164.all;
use	ieee.numeric_std.all;

entity	breg_ula	is
	generic	(	WSIZE	:	natural	:=	32;
			ISIZE	:	natural	:=	5;
			BREGSIZE	:	natural	:=	32	);
	port	
	(
		rs 	:	in	 	std_logic_vector(ISIZE-1	downto	0);
		rt 	:	in	 	std_logic_vector(ISIZE-1	downto	0);
		rd 	:	in	 	std_logic_vector(ISIZE-1	downto	0);
		we 	:	in		std_logic;
		d_in 	:	in		std_logic_vector(WSIZE-1	downto	0);
		clk 	:	in		std_logic;
		func	:	in		std_logic_vector(5	downto	0);
		opUla 	:	in		std_logic_vector(1	downto	0);
		
		zero 	 :	out	std_logic;	
		d_out	 :	out	std_logic_vector(WSIZE-1	downto	0)
);
end breg_ula;


architecture	behavioral	of	breg_ula	is

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


component	ula	is
	generic	(	WSIZE	:	natural	:=	32);
	port	(	
		ulop :	in	std_logic_vector(3	downto	0);
		A,	B :	in	std_logic_vector(WSIZE-1	downto	0);	
		aluout:	out	std_logic_vector(WSIZE-1	downto	0);	
		zero:	out	std_logic	
		);
end	component;


component	c_ula	is
	port	(
	func	 :	in	std_logic_vector(5	downto	0);
	opUla :	in	std_logic_vector(1	downto	0);
	ctrula	 :	out	std_logic_vector(3	downto	0)
	);
end	component;

signal tempA		 : std_logic_vector(31	downto	0):= (others => '0');
signal tempB		 : std_logic_vector(31	downto	0):= (others => '0');
signal ulaop_temp 	 : std_logic_vector(3	downto	0):= (others => '0');

begin

BREG_PM: breg port map (
							clk=>clk,
		we	=> we,
		rs => rs,
		rt => rt,
		rd => rd,
		d_in => d_in,
		regA => tempA,
		regB => tempB
		);
		
CONTROLE_PM: c_ula port map (
	func => func,
	opUla => opUla,
	ctrula => ulaop_temp

);

ULA_PM: ula port map (
		ulop => ulaop_temp,
		A => tempA,	
		B => tempB,
		aluout => d_out,
		zero => zero
);


end	architecture	behavioral;