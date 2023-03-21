library IEEE;
use IEEE.STD_LOGIC_1164.all;  
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;   

entity Memorie_ROM_ID_CARD is
	 port(
	     ID_introdus : in STD_LOGIC_VECTOR(3 downto 0);
	 	 CS: in STD_LOGIC;
		 ID_ROM : out STD_LOGIC_VECTOR(3 downto 0)
	     );
end Memorie_ROM_ID_CARD;

architecture Memorie_ROM_ID_Card of Memorie_ROM_ID_CARD is
begin 													   										
	process(CS, ID_introdus)
	begin 									 							
		if(CS = '1' ) then
			case (ID_introdus) is
				when "0001" => ID_ROM <= "0001";
				when "0010" => ID_ROM <= "0010";
				when "0011" => ID_ROM <= "0011";
				when "0100" => ID_ROM <= "0100";  
			    when others => ID_ROM <= "ZZZZ";
			end case;
		end if;
	end process;		
end Memorie_ROM_ID_Card;
