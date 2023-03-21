library IEEE;
use IEEE.STD_LOGIC_1164.all;  
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;   

entity Interogare_sold is
	 port(
		 S_cont : in STD_LOGIC_VECTOR(11 downto 0);
		 OK_PIN : in STD_LOGIC;
		 alegere_optiune: in STD_LOGIC_VECTOR (1 downto 0);
		 OK_afisare : out STD_LOGIC_VECTOR(11 downto 0)
		 );	 
		 end  Interogare_sold;

architecture Interogare_sold of Interogare_sold is
begin 
	process (OK_PIN)
	begin
		if (OK_PIN = '1' and alegere_optiune = "00") then OK_afisare <= S_cont;	
		end if;
	end process;  
	
end Interogare_sold;
