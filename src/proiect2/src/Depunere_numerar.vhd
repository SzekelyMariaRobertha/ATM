library IEEE;
use IEEE.STD_LOGIC_1164.all;  
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;   

entity Depunere_numerar is
	 port(
		 S_cont : in STD_LOGIC_VECTOR(11 downto 0); 
		 S_introdusa: in STD_LOGIC_VECTOR(11 downto 0);
		 alegere_optiune: in STD_LOGIC_VECTOR (1 downto 0);
		 OK_PIN : in STD_LOGIC;
		 S_noua: out STD_LOGIC_VECTOR(11 downto 0) 
	     );	 
		 end  Depunere_numerar;

architecture Depunere_numerar of Depunere_numerar is
begin	 
	process (S_cont, OK_PIN)
	begin
		if (OK_PIN = '1' and alegere_optiune = "10") then
			S_noua <= S_cont + S_introdusa; 
		end if;	
	end process;   
	
end Depunere_numerar;
