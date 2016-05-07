----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:12:07 03/15/2016 
-- Design Name: 
-- Module Name:    Filtro_inicial - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use WORK.FLOAT_PKG.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Filtro_inicial is
	Port(Reset      : in  STD_LOGIC;
		 Clk        : in  STD_LOGIC;
		 Data_in    : in  STD_LOGIC_VECTOR(31 downto 0);
		 Data_out   : out STD_LOGIC_VECTOR(31 downto 0);
		 Validacion : in  STD_LOGIC;
		 Valid_out  : out STD_LOGIC);
end Filtro_inicial;

architecture Behavioral of Filtro_inicial is
	component data_path
		Port(
			Reset    : in  STD_LOGIC;
			Clk      : in  STD_LOGIC;
			Comandos : in  STD_LOGIC_VECTOR(2 downto 0);
			Entradas : in  STD_LOGIC_VECTOR(31 downto 0);
			Salidas  : out STD_LOGIC_VECTOR(31 downto 0);
			Flags    : out STD_LOGIC_VECTOR(7 downto 0));
	end component;

	component control
		Port(
			Reset      : in  STD_LOGIC;
			Clk        : in  STD_LOGIC;
			Validacion : in  STD_LOGIC;
			Comandos   : out STD_LOGIC_VECTOR(2 downto 0);
			Flags      : in  STD_LOGIC_VECTOR(7 downto 0);
			Fin        : out STD_LOGIC);
	end component;

	component interfaz_entrada
		Port(
			Reset      : in  STD_LOGIC;
			Clk        : in  STD_LOGIC;
			Validacion : in  STD_LOGIC;
			Data_in    : in  STD_LOGIC_VECTOR(31 downto 0);
			Entradas   : out STD_LOGIC_VECTOR(31 downto 0));
	end component;

	component interfaz_salida
		Port(
			Reset     : in  STD_LOGIC;
			Clk       : in  STD_LOGIC;
			Fin       : in  STD_LOGIC;
			Salidas   : in  STD_LOGIC_VECTOR(31 downto 0);
			Data_out  : out STD_LOGIC_VECTOR(31 downto 0);
			Valid_out : out STD_LOGIC);
	end component;

	signal Comandos_sig : STD_LOGIC_VECTOR(2 downto 0);
	signal Entradas_sig : STD_LOGIC_VECTOR(31 downto 0);
	signal Salidas_sig  : STD_LOGIC_VECTOR(31 downto 0);
	signal Flags_sig    : STD_LOGIC_VECTOR(7 downto 0);
	signal Fin_sig      : STD_LOGIC;

begin
	Path : data_path
		port map(Reset, Clk, Comandos_sig, Entradas_sig, Salidas_sig, Flags_sig);

	Controlador : control
		port map(Reset, Clk, Validacion, Comandos_sig, Flags_sig, Fin_sig);

	Entrada : interfaz_entrada
		port map(Reset, Clk, Validacion, Data_in, Entradas_sig);

	Salida : interfaz_salida
		port map(Reset, Clk, Fin_sig, Salidas_sig, Data_out, Valid_out);

end Behavioral;

