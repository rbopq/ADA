----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:22:35 03/17/2016 
-- Design Name: 
-- Module Name:    interfaz_salida - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity interfaz_salida is
	Port(Reset     : in  STD_LOGIC;
		 Clk       : in  STD_LOGIC;
		 Fin       : in  STD_LOGIC;
		 Salidas   : in  STD_LOGIC_VECTOR(31 downto 0);
		 Data_out  : out STD_LOGIC_VECTOR(31 downto 0);
		 Valid_out : out STD_LOGIC);
end interfaz_salida;

architecture Behavioral of interfaz_salida is
begin
	proc_salida : process(reset, clk)
	begin
		if reset = '0' then
			Data_out  <= (others => '0');
			Valid_out <= '0';
		elsif (clk'event and clk = '1') then
			Valid_out <= '0';
			if Fin = '1' then
				Data_out  <= Salidas;
				Valid_out <= '1';
			end if;
		end if;
	end process;

end Behavioral;

