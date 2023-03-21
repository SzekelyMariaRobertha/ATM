library IEEE;
use IEEE.STD_LOGIC_1164.all;  
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;   

entity Extragere_numerar is
	 port(
		 S_cont : in STD_LOGIC_VECTOR(11 downto 0);
		 S_banca : in STD_LOGIC_VECTOR(11 downto 0); 
		 S_extragere : in STD_LOGIC_VECTOR(11 downto 0);
		 OK_PIN : in STD_LOGIC;
		 alegere_optiune: in STD_LOGIC_VECTOR (1 downto 0);
		 S_cont_nou : out STD_LOGIC_VECTOR(11 downto 0);
		 S_banca_nou : out STD_LOGIC_VECTOR(11 downto 0);
		 OK_extragere : out STD_LOGIC
	     );	 
		 end Extragere_numerar;

architecture Comparator_extragere_suma of Extragere_numerar is
begin
	process(S_banca, S_cont, S_extragere, OK_PIN) 
	begin
	if (OK_PIN = '1' and alegere_optiune = "01") then	
		if( S_banca >= S_cont and S_extragere <= S_cont ) then 
				OK_extragere <= '1';
				S_banca_nou <= S_banca - S_extragere;
				S_cont_nou <= S_cont - S_extragere; 
			else 
				OK_extragere <= '0';
		end if;	   
		end if;		 
	end process; 

end Comparator_extragere_suma;
