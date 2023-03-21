library IEEE;
use IEEE.STD_LOGIC_1164.all;  
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;   

entity Memorie_RAM_PIN is
	 port(
	     PIN_introdus : in STD_LOGIC_VECTOR(3 downto 0);
	 	 CS: in STD_LOGIC;	
		 writeenable: in STD_LOGIC;	
		 PIN_nou: in STD_LOGIC_VECTOR(3 downto 0);
		 PIN_RAM : out STD_LOGIC_VECTOR(3 downto 0)
	     );
end Memorie_RAM_PIN;

architecture Memorie_RAM_PIN of Memorie_RAM_PIN is
begin 
	process(CS, PIN_introdus)
	begin 
		if(CS = '1' ) then 
			if(writeenable = '0') then 
				
			case (PIN_introdus) is
				when("0001") => PIN_RAM <= "0001";
				when("0010") => PIN_RAM <= "0010";
				when("0011") => PIN_RAM <= "0011";
				when("0100") => PIN_RAM <= "0100";  
			    when others  => PIN_RAM <= "ZZZZ";
			end case; 
			else  
				case(PIN_introdus) is
				when("0001") => PIN_RAM <= PIN_nou;
				when("0010") => PIN_RAM <= PIN_nou;
				when("0011") => PIN_RAM <= PIN_nou;
				when("0100") => PIN_RAM <= PIN_nou; 
				when others  => PIN_RAM <= "ZZZZ";
				end case;
				
			end if;
			end if;
	end process;		
end Memorie_RAM_PIN;
