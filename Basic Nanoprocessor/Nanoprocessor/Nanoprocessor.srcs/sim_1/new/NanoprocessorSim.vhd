library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 

entity NanoprocessorSim is --  Port ( ); 
end NanoprocessorSim;
 
architecture Behavioral of NanoprocessorSim is 

component nanoprocessor is 
Port (NanoClock : in STD_LOGIC;
       Reset : in STD_LOGIC;
       FourLED : out STD_LOGIC_VECTOR (3 downto 0);
       SevenSegment : out STD_LOGIC_VECTOR (6 downto 0);
       OverflowLED : out STD_LOGIC;
       ZeroLED : out STD_LOGIC ;
       Anode : out STD_LOGIC_VECTOR (3 downto 0));
end component; 

signal reset , zeroled , overflowled : STD_LOGIC; 
signal fourled :STD_LOGIC_VECTOR (3 downto 0); 
signal sevensegment :  STD_LOGIC_VECTOR (6 downto 0); 
signal anode : STD_LOGIC_VECTOR (3 downto 0); 
signal nanoclock :std_logic:='1'; 

begin 

uut : nanoprocessor port map ( 
   NanoClock => nanoclock ,
   Reset => reset ,
   FourLED => fourled,
   SevenSegment => sevensegment ,
   OverflowLED => overflowled,
   ZeroLED => zeroled ,
   Anode => anode
    ); 


process begin 
nanoclock <= NOT nanoclock; 
wait for 3ns; 
end process; 


process 
begin 
    Reset <='1'; 
    wait for 200ns; 
    Reset <='0'; 
    wait;
end process; 

end Behavioral; 





