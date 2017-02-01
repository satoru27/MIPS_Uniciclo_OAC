LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY breg_ula_tb IS
END breg_ula_tb;

ARCHITECTURE breg_ula_arch OF breg_ula_tb IS

-- signals
signal		rs 	: std_logic_vector(4	downto	0);
signal		rt 	: std_logic_vector(4	downto	0);
signal		rd 	: std_logic_vector(4	downto	0);
signal		we 	: std_logic;
signal		d_in 	: std_logic_vector(31	downto	0);
signal		clk 	: std_logic;
signal		func	: std_logic_vector(5	downto	0);
signal		opUla 	: std_logic_vector(1	downto	0);

signal		zero 	 : std_logic;	
signal		d_out	 : std_logic_vector(31	downto	0);


component	breg_ula	is
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
end component;


BEGIN
b1 : breg_ula PORT MAP (
rs=>rs,
rt=>rt,
rd=>rd,
we=>we,
d_in=>d_in,
clk=>clk,
func=>func,
opUla=>opUla,
zero=>zero,
d_out=>d_out
);

init : PROCESS
-- variable declarations
BEGIN
clk <= '0';
wait for 2 ps;

--teste registradores
rs<="00000";
rt<="00000";
rd<="00000"; -- 0
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="00001";
rd<="00001"; -- 1
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="00010";
rd<="00010"; -- 2
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="00011";
rd<="00011"; -- 3
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="00100";
rd<="00100"; -- 4
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="00101";
rd<="00101"; -- 5
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="00110";
rd<="00110"; -- 6
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="00111";
rd<="00111"; -- 7
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="01000";
rd<="01000"; -- 8
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="01001";
rd<="01001"; -- 9
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="01010";
rd<="01010"; -- 10
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="01011";
rd<="01011"; -- 11
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="01100";
rd<="01100"; -- 12
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="01101";
rd<="01101"; -- 13
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="01110";
rd<="01110"; -- 14
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="01111";
rd<="01111"; -- 15
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="10000";
rd<="10000"; -- 16
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="10001";
rd<="10001"; -- 17
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="10010";
rd<="10010"; -- 18
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="10011";
rd<="10011"; -- 19
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="10100";
rd<="10100"; -- 20
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="10101";
rd<="10101"; -- 21
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="10110";
rd<="10110"; -- 22
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="10111";
rd<="10111"; -- 23
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="11000";
rd<="11000"; -- 24
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="11001";
rd<="11001"; -- 25
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="11010";
rd<="11010"; -- 26
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="11011";
rd<="11011"; -- 27
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="11100";
rd<="11100"; -- 28
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="11101";
rd<="11101"; -- 29
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="11110";
rd<="11110"; -- 30
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="11111";
rd<="11111"; -- 31
we<='1';
d_in<="01111111111111111111111111111111"; -- 2147483647
func<="XXXXXX";
opUla<="00";	
clk <= not clk;
wait for 2 ps;




---- preparacao teste operacoes
clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="10000";
rd<="10000"; 
we<='1';
d_in<="00000000000000000000000000100000"; -- 32
func<="XXXXXX";
opUla<="00";	-- write $16 with 32, add $16 $zero
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="10001";
rd<="10001";
we<='1';
d_in<="11111111111111111111111111100000"; -- -32
func<="XXXXXX";
opUla<="00"; 	-- write $17 with -32, add $16 $0
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="00000";
rt<="10010";
rd<="10010";
we<='1';
d_in<="00000000000000000000000101111100"; -- 380
func<="XXXXXX";
opUla<="00"; 	-- write $18 with 380
clk <= not clk;
wait for 2 ps;

--- teste operacoes
clk <= not clk;
wait for 2 ps;
rs<="10000";
rt<="10000";
rd<="10000"; 	
we<='0';
d_in<="00000000000000000000000000000000";
func<="XXXXXX";
opUla<="00";	-- add: 32 + 32, teste pos
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="10000";
rt<="10001";
rd<="10000"; 	
we<='0';
d_in<="00000000000000000000000000000000";
func<="XXXXXX";
opUla<="00";	-- add: 32 + (-32), teste zero
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="10001";
rt<="10001";
rd<="10000"; 	
we<='0';
d_in<="00000000000000000000000000000000";
func<="XXXXXX";
opUla<="00";	-- add: (-32) + (-32), teste neg
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="10010";
rt<="10000";
rd<="10000"; 
we<='0';
d_in<="00000000000000000000000000000000";
func<="XXXXXX";
opUla<="01";	-- sub: 380 - 32, teste pos
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="10000";
rt<="10000";
rd<="10000"; 
we<='0';
d_in<="00000000000000000000000000000000";
func<="XXXXXX";
opUla<="01";	-- sub: 32 - 32, teste zero
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="10001";
rt<="10000";
rd<="10000"; 
we<='0';
d_in<="00000000000000000000000000000000";
func<="XXXXXX";
opUla<="01";	-- sub: -32 - (+32), teste neg
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="10000";
rt<="10010";
rd<="10000";
we<='0';
d_in<="00000000000000000000000000000000";
func<="100000";
opUla<="10"; 	-- add: 32 +380, teste pos
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="10000";
rt<="10001";
rd<="10000";
we<='0';
d_in<="00000000000000000000000000000000";
func<="100000";
opUla<="10"; 	-- add: 32 + (-32), teste zero
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="10001";
rt<="10001";
rd<="10000";
we<='0';
d_in<="00000000000000000000000000000000";
func<="100000";
opUla<="10"; 	-- add: (-32) + (-32), teste neg
clk <= not clk;
wait for 2 ps;


clk <= not clk;
wait for 2 ps;
rs<="10000";
rt<="10001";
rd<="10000";
we<='0';
d_in<="00000000000000000000000000000000";
func<="100010";
opUla<="10"; 	-- sub: 32 - (-32), teste pos
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="10000";
rt<="10000";
rd<="10000";
we<='0';
d_in<="00000000000000000000000000000000";
func<="100010";
opUla<="10"; 	-- sub: 32 - 32, teste zero
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="10001";
rt<="10000";
rd<="10000";
we<='0';
d_in<="00000000000000000000000000000000";
func<="100010";
opUla<="10"; 	-- sub: -32 - (+32), teste neg
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="10000";
rt<="10001";
rd<="10000";
we<='0';
d_in<="00000000000000000000000000000000";
func<="100100";
opUla<="10"; 	-- and: 32, -32
clk <= not clk;
wait for 2 ps;


clk <= not clk;
wait for 2 ps;
rs<="10000";
rt<="10001";
rd<="10000";
we<='0';
d_in<="00000000000000000000000000000000";
func<="100101";
opUla<="10"; 	-- or: 32, -32
clk <= not clk;
wait for 2 ps;


clk <= not clk;
wait for 2 ps;
rs<="10001";
rt<="10000";
rd<="10000";
we<='0';
d_in<="00000000000000000000000000000000";
func<="101010";
opUla<="10"; 	-- slt: -32, 32
clk <= not clk;
wait for 2 ps;

clk <= not clk;
wait for 2 ps;
rs<="10001";
rt<="10000";
rd<="10000";
we<='0';
d_in<="00000000000000000000000000000000";
func<="100111";
opUla<="10"; 	-- nor: -32, 32
clk <= not clk;
wait for 2 ps;



END PROCESS init;


END breg_ula_arch;
