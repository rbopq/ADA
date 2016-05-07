----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:14:08 03/17/2016 
-- Design Name: 
-- Module Name:    interfaz_entrada - Behavioral 
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

entity interfaz_entrada is
    Port ( Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Validacion : in  STD_LOGIC;
           Data_in : in  STD_LOGIC_VECTOR (31 downto 0);
           Entradas : out  STD_LOGIC_VECTOR (31 downto 0));
end interfaz_entrada;

architecture Behavioral of interfaz_entrada is

begin

proc_captura: process(reset, clk)
begin 
	if reset='0' then 
		Entradas<= (others => '0');
	elsif (clk'event and clk='1') then
		if Validacion = '1' then
			Entradas <= Data_in;
		end if;
	end if;
end process;

end Behavioral;

