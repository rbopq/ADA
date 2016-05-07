----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:43:23 05/07/2016 
-- Design Name: 
-- Module Name:    multiplicador_mux_2_1 - Behavioral 
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

use IEEE.NUMERIC_STD.ALL;
use modeltech.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sumador_mux_2_1 is
	Port(operando_a_1 : in SFIXED(1 downto -22);
		 operandoa_a_2 : in SFIXED(1 downto -22);
		 operando_b_1 : in SFIXED(1 downto -22);
		 operandoa_b_2 : in SFIXED(1 downto -22);
		 resultado	: out SFIXED(1 downto -22);
		 sel        : in STD_LOGIC);
end sumador_mux_2_1;

architecture Behavioral of multiplicador_mux_2_1 is
begin
	resultado <= resize(operando_a_1 + operando_b_1, 1, -22) when sel='1' else resize(operando_a_2 + operando_b_2, 1, -22);
end Behavioral;

