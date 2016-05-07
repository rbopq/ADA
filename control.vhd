----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:46:37 03/17/2016 
-- Design Name: 
-- Module Name:    control - Behavioral 
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

entity control is
    Port ( Reset : in  STD_LOGIC;
           Clk : in  STD_LOGIC;
           Validacion : in  STD_LOGIC;
           Comandos : out  STD_LOGIC_VECTOR (2 downto 0);
			  Flags	  : in STD_LOGIC_VECTOR (7 downto 0);
           Fin : out  STD_LOGIC);
end control;

architecture Behavioral of control is

signal estado : integer range 0 to 7 ;

begin

proc_estado: process(reset, clk)
begin 
	if reset='0' then 
		estado<= integer(0);
	elsif (clk'event and clk='1') then
		if Validacion ='1' then
			estado <= estado +1;
			if estado= 7 then
				estado <= integer(0);
			end if;
		end if;	
	end if;
end process;

proc_comandos: process(reset, clk)
begin 
	if reset='0' then
		Comandos <= (others => '0');
		Fin<='0';	
	elsif (clk'event and clk='1') then
		Comandos <= (others => '0');
		Fin<='0';
		case estado is
			when 0=>
				Comandos<= "000";
			when 1 =>
				Comandos<= "001";
			when 2 =>
				Comandos<= "010";
			when 3 =>
				Comandos<= "011";
			when 4 =>
				Comandos<= "100";
			when 5 =>
				Comandos<= "101";
				Fin<='1';
			when 6 =>
				Comandos<= "110";
			when others =>
		end case;	
	end if;		
end process;

end Behavioral;

