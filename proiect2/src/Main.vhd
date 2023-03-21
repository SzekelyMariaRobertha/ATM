library IEEE;
use IEEE.STD_LOGIC_1164.all;  
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;   
 
entity bancomat is	
	port( 
		 ID_introdus : in STD_LOGIC_VECTOR(3 downto 0);
	 	 CS: in STD_LOGIC;
		 writeenable: in STD_LOGIC;	 
		 PIN_RAM : in STD_LOGIC_VECTOR(3 downto 0);
		 PIN_introdus : in STD_LOGIC_VECTOR(3 downto 0);	
		 S_cont : in STD_LOGIC_VECTOR(11 downto 0);	
		 alegere_optiune: in STD_LOGIC_VECTOR (1 downto 0);
		 S_banca : in STD_LOGIC_VECTOR(11 downto 0);  
		 S_extragere : in STD_LOGIC_VECTOR(11 downto 0);
		 S_introdusa: in STD_LOGIC_VECTOR(11 downto 0);
		 optiune : in STD_LOGIC;
		 Q : out STD_LOGIC;
		 OK_ID : out  STD_LOGIC;
		 S_cont_nou : out STD_LOGIC_VECTOR(11 downto 0);
		 OK_afisare : out STD_LOGIC_VECTOR(11 downto 0);
		 OK_PIN : out STD_LOGIC;  
		 S_banca_nou : out STD_LOGIC_VECTOR(11 downto 0);
		 S_nou: out STD_LOGIC_VECTOR(11 downto 0);	
		 S_noua: out STD_LOGIC_VECTOR(11 downto 0);
		 OK_extragere : out STD_LOGIC; 
		 PIN_card_RAM : out STD_LOGIC_VECTOR(3 downto 0);
		 ID_ROM : out STD_LOGIC_VECTOR(3 downto 0)
		);
end entity;
 
architecture bancomat of bancomat is
 
component Memorie_ROM_ID_Card is
	 port(
	     ID_introdus : in STD_LOGIC_VECTOR(3 downto 0);
	 	 CS: in STD_LOGIC;
		 ID_ROM : out STD_LOGIC_VECTOR(3 downto 0)
	     );
end component Memorie_ROM_ID_Card;	 
 
component Memorie_RAM_PIN is
	 port(
	     PIN_introdus : in STD_LOGIC_VECTOR(3 downto 0);
	 	 CS: in STD_LOGIC;	
		 writeenable: in STD_LOGIC;	
		 PIN_nou: in STD_LOGIC_VECTOR(3 downto 0);
		 PIN_RAM : out STD_LOGIC_VECTOR(3 downto 0)
	     );
end component Memorie_RAM_PIN; 
 					
component Comparator_ID is
	port(
		ID_introdus : in STD_LOGIC_VECTOR(3 downto 0);
		ID_ROM : in STD_LOGIC_VECTOR(3 downto 0);
		OK_ID : out  STD_LOGIC := '0'
		);
end component Comparator_ID;  
 
component Comparator_PIN is
	port(
		PIN_RAM : in STD_LOGIC_VECTOR(3 downto 0); 
		ID_introdus: in STD_LOGIC_VECTOR(3 downto 0);
		PIN_introdus : in STD_LOGIC_VECTOR(3 downto 0);	
		OK_ID: in STD_LOGIC;
		OK_PIN : out STD_LOGIC := '0'	
		);
end component;

component Interogare_sold is
	 port(
		 S_cont : in STD_LOGIC_VECTOR(11 downto 0);
		 OK_PIN : in STD_LOGIC;
		 alegere_optiune: in STD_LOGIC_VECTOR (1 downto 0);
		 OK_afisare : out STD_LOGIC_VECTOR(11 downto 0)
	     );	 
end component;
 
component Extragere_numerar is
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
		 end component; 

component Depunere_numerar is
	 port(
		 S_cont : in STD_LOGIC_VECTOR(11 downto 0); 
		 S_introdusa: in STD_LOGIC_VECTOR(11 downto 0);
		 alegere_optiune: in STD_LOGIC_VECTOR (1 downto 0);
		 OK_PIN : in STD_LOGIC;
		 S_noua: out STD_LOGIC_VECTOR(11 downto 0) 
	     );	 
		 end  component;

component Schimbare_PIN is
	 port(
	 	 PIN_introdus : in STD_LOGIC_VECTOR(3 downto 0); 
	 	 writeenable: in STD_LOGIC;
		 OK_PIN : in STD_LOGIC;
		 alegere_optiune: in STD_LOGIC_VECTOR (1 downto 0);
		 PIN_card_RAM : out STD_LOGIC_VECTOR(3 downto 0)
	     );
end component;

component Chitanta is
	 port(
		 optiune : in STD_LOGIC;
		 Q : out STD_LOGIC
	     );
end component;		 

signal out_rom: std_logic_vector(3 downto 0);	
signal out_pin_ram: std_logic_vector(3 downto 0);
signal ok_id_signal: std_logic;
signal ok_pin_signal: std_logic; 
signal pin_nou: std_logic_vector(3 downto 0);

begin	
	
 pas0: Memorie_ROM_ID_CARD port map(ID_introdus, CS, out_rom);
 pas1: Memorie_RAM_PIN port map(PIN_introdus => PIN_introdus, CS => CS, writeenable => writeenable, PIN_nou => PIN_nou, PIN_RAM => out_pin_ram);
 pas2: Comparator_ID port map(ID_introdus, out_rom, ok_id_signal);
 pas3: Comparator_PIN port map(out_pin_ram, ID_introdus, PIN_introdus, ok_id_signal, ok_pin_signal);	  
 pas4: Interogare_sold port map(S_cont, ok_pin_signal, alegere_optiune, OK_afisare);
 pas5: Extragere_numerar port map(S_cont, S_banca, S_extragere, ok_pin_signal, alegere_optiune, S_cont_nou, S_banca_nou, OK_extragere);
 pas6: Depunere_numerar port map(S_cont, S_introdusa, alegere_optiune, ok_pin_signal, S_noua);
 pas7: Schimbare_PIN port map(PIN_introdus,writeenable, ok_pin_signal, alegere_optiune, pin_nou);
 pas8: Chitanta port map(optiune, Q);
 
 PIN_card_RAM <= pin_nou;
 OK_ID <= ok_id_signal;
 OK_PIN <= ok_pin_signal; 

 end architecture;
