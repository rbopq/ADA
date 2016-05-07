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
use WORK.FIXED_PKG.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity data_path is
    Port ( Reset 		: in  	STD_LOGIC;
           Clk 		: in  	STD_LOGIC;
           Comandos 	: in  	STD_LOGIC_VECTOR (2 downto 0);
           Entradas 	: in  	STD_LOGIC_VECTOR (31 downto 0);
           Salidas	: out  	STD_LOGIC_VECTOR (31 downto 0);
           Flags 		: out  	STD_LOGIC_VECTOR (7 downto 0));	
end data_path;

architecture Behavioral of data_path is
signal aux_multip: SFIXED(23 downto -40);

signal 	tmp0, tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7, tmp8, tmp9, 
			tmp10, tmp11, tmp12, tmp13, tmp14, tmp15, tmp16, tmp17, 
			tmp18, sv1,sv2, sv3, sv4: SFIXED(11 downto -20);

constant a_0 : SFIXED := to_sfixed(1, 11, -20);
constant a_1 : SFIXED := to_sfixed(-0.782095, 11, -20);
constant a_2 : SFIXED := to_sfixed( 0.679979, 11, -20);
constant a_3 : SFIXED := to_sfixed(-0.182676, 11, -20);   
constant a_4 : SFIXED := to_sfixed( 0.030119, 11, -20);

constant b_0 : SFIXED := to_sfixed( 0.046583, 11, -20);
constant b_1 : SFIXED := to_sfixed( 0.186332, 11, -20);
constant b_2 : SFIXED := to_sfixed( 0.279497, 11, -20);
constant b_3 : SFIXED := to_sfixed( 0.186332, 11, -20);
constant b_4 : SFIXED := to_sfixed( 0.046583, 11, -20);

-- Estados que represetan el ciclo del reloj
signal ciclo : integer range 0 to 7 ;
begin

proc_secuen: process(reset, clk)
begin 
	if reset='0' then
		Salidas <= (others=> '0');
		Flags <= (others=> '0');
		tmp0<=(others =>'0');
		tmp1<=(others =>'0');
		tmp2<=(others =>'0');
		tmp3<=(others =>'0');
		tmp4<=(others =>'0');
		tmp5<=(others =>'0');
		tmp6<=(others =>'0');
		tmp7<=(others =>'0');
		tmp8<=(others =>'0');
		tmp9<=(others =>'0');
		tmp10<=(others =>'0');
		tmp11<=(others =>'0');
		tmp12<=(others =>'0');
		tmp13<=(others =>'0');
		tmp14<=(others =>'0');
		tmp15<=(others =>'0');
		tmp16<=(others =>'0');
		tmp17<=(others =>'0');
		tmp18<=(others =>'0');
		sv1<=(others => '0');
		sv2<=(others => '0');
		sv3<=(others => '0');
		sv4<=(others => '0');
	
	elsif (clk'event and clk='1') then
		case Comandos is
			when "000"=>
				tmp0<=  to_sfixed(Entradas, 11, -20);
			when "001" =>
				tmp1<=resize(b_0*tmp0, 11, -20);
				tmp2<=resize(b_1*tmp0, 11, -20);
				tmp3<=resize(b_2*tmp0, 11, -20);
				tmp4<=resize(b_3*tmp0, 11, -20);
				tmp5<=resize(b_4*tmp0, 11, -20);				
			when "010" =>
				tmp6<= resize(tmp4+sv4, 11, -20);
				tmp7<= resize(tmp3+sv3, 11, -20);
				tmp8<= resize(tmp2+sv2, 11, -20);
				tmp9<= resize(tmp1+sv1, 11, -20);
			when "011" =>
				tmp10<= resize(tmp9*(-1), 11, -20);
				tmp11<= resize(tmp10*(-a_1), 11, -20);
				tmp12<= resize(tmp10*(-a_2), 11, -20);
				tmp13<= resize(tmp10*(-a_3), 11, -20);
				tmp14<= resize(tmp10*(-a_4), 11, -20);
			when "100" =>
				tmp15<= resize(tmp8+tmp11, 11, -20);
				tmp16<= resize(tmp7+tmp12, 11, -20);
				tmp17<= resize(tmp6+tmp13, 11, -20);
				tmp18<= resize(tmp5+tmp14, 11, -20);
			when "101" =>
				Salidas<=to_slv(tmp10);
			when "110" =>
				sv4<=tmp18;
				sv3<=tmp17;
				sv2<=tmp16;
				sv1<=tmp15;
			when others =>
		end case;	
	end if;		
end process;

end Behavioral;

