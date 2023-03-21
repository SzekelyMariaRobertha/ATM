library IEEE;
use IEEE.STD_LOGIC_1164.all;  
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;   

entity Schimbare_PIN is
	 port(
		 PIN_introdus : in STD_LOGIC_VECTOR(3 downto 0); 
		 writeenable: in STD_LOGIC;
		 OK_PIN : in STD_LOGIC;
		 alegere_optiune: in STD_LOGIC_VECTOR (1 downto 0);
		 PIN_card_RAM : out STD_LOGIC_VECTOR(3 downto 0)
	     );
end Schimbare_PIN;

architecture Schimbare_RAM_PIN of Schimbare_PIN is
begin 
	process (OK_PIN)
	begin
		if (OK_PIN = '1' and alegere_optiune = "11") then 
			if(writeenable = '1') then PIN_card_RAM <= PIN_introdus;	
		end if;	 
		end if;
	end process;
	
end Schimbare_RAM_PIN;
