library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PCSim is
--  Port ( );
end PCSim;

architecture Behavioral of PCSim is

component PC 
port ( PCIn : in STD_LOGIC_VECTOR (2 downto 0) ; 
       PCClock : in STD_LOGIC; 
       Reset : in STD_LOGIC; 
       PCOut : out STD_LOGIC_VECTOR (2 downto 0)); 
end component; 

signal pcclock : std_logic:='0';  
signal reset : std_logic;  
signal pcin : std_logic_vector(2 downto 0) := "000"; 
signal pcout : std_logic_vector(2 downto 0);  


begin

UUT:PC
port map( 
PCClock=>pcclock,  
Reset=>reset,  
PCOut=>pcout,  
PCIn=>pcin 
); 



process begin
   
pcclock <= not(pcclock); 
wait for 5ns; 
end process; 

process begin   
reset<='1';  
pcin<="000";  
wait for 50ns;  
pcin<="001"; 
wait for 50ns;  
pcin<="010"; 
wait for 50ns;  
pcin<="011"; 
wait for 50ns;  
pcin<="101"; 
wait for 50ns;  
pcin<="110"; 
wait for 50ns;  
pcin<="111"; 
wait for 50ns; 


reset<='0';  
pcin<="000";  
wait for 50ns;  
pcin<="001"; 
wait for 50ns;  
pcin<="010"; 
wait for 50ns;  
pcin<="011"; 
wait for 50ns;  
pcin<="101"; 
wait for 50ns;  
pcin<="110"; 
wait for 50ns;  
pcin<="111"; 
wait;  
end process;  





end Behavioral;






