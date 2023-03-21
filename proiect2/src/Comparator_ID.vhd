library IEEE;
use IEEE.STD_LOGIC_1164.all;  
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;   

entity Comparator_ID is
	port(
		ID_introdus : in STD_LOGIC_VECTOR(3 downto 0);
		ID_ROM : in STD_LOGIC_VECTOR(3 downto 0);
		OK_ID : out  STD_LOGIC := '0'
		);
end Comparator_ID;
 
architecture Comparator_ID of Comparator_ID is
begin 
	
	OK_ID <= '1' when (ID_introdus = ID_ROM) else '0'; 
	
end Comparator_ID;
