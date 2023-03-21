library IEEE;
use IEEE.STD_LOGIC_1164.all;  
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;   

entity Comparator_PIN is
	port(
	PIN_RAM : in STD_LOGIC_VECTOR(3 downto 0);	
	ID_introdus: in STD_LOGIC_VECTOR(3 downto 0);
		PIN_introdus : in STD_LOGIC_VECTOR(3 downto 0);	
		OK_ID: in STD_LOGIC;
		OK_PIN : out STD_LOGIC := '0'	
		);
end Comparator_PIN;
 
architecture Comparator_PIN of Comparator_PIN is
begin  
	process (OK_ID, PIN_RAM, PIN_introdus, ID_introdus)
	begin
		if (OK_ID = '1') then 
		if (PIN_introdus = PIN_RAM and PIN_RAM = ID_introdus)  then 
		OK_PIN <= '1'; 
		else OK_PIN <= '0';
		end if; 
		end if;
	end process;   
	
end Comparator_PIN;
