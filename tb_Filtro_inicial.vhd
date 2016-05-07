-- TestBench Template 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS

	-- Component Declaration
	component Filtro_inicial
		Port(
			Reset      : in  STD_LOGIC;
			Clk        : in  STD_LOGIC;
			Data_in    : in  STD_LOGIC_VECTOR(31 downto 0);
			Data_out   : out STD_LOGIC_VECTOR(31 downto 0);
			Validacion : in  STD_LOGIC;
			Valid_out  : out STD_LOGIC);
	end component;

	constant Clk_period : time := 50 ns;

	signal Reset      : STD_LOGIC;
	signal Clk        : STD_LOGIC;
	signal Data_in    : STD_LOGIC_VECTOR(31 downto 0);
	signal Data_out   : STD_LOGIC_VECTOR(31 downto 0);
	signal Validacion : STD_LOGIC;
	signal Valid_out  : STD_LOGIC;

begin
	filtro : Filtro_inicial PORT MAP(Reset, Clk, Data_in, Data_out, Validacion, Valid_out);

	-- Clock process definitions
	Clk_process : process
	begin
		Clk <= '0';
		wait for Clk_period / 2;
		Clk <= '1';
		wait for Clk_period / 2;
	end process;

	--  Test Bench Statements
	tb : PROCESS
	BEGIN
		Reset <= '0';
		wait for 60 ns;                 -- wait until global set/reset completes
		Data_in    <= X"00100000";
		Validacion <= '1';
		Reset      <= '1';

		wait;                           -- will wait forever
	END PROCESS tb;

END;
