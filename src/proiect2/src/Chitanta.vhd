library IEEE;
use IEEE.STD_LOGIC_1164.all;  
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;   

entity Chitanta is
	 port(
		 optiune : in STD_LOGIC;
		 Q : out STD_LOGIC
	     );
end Chitanta;

architecture Chitanta of Chitanta is  
begin 
	process(optiune)
	begin
		if(optiune = '1') then Q <= '1';
		else 
			Q <= '0';
		end if;
	end process;
		
end Chitanta;
