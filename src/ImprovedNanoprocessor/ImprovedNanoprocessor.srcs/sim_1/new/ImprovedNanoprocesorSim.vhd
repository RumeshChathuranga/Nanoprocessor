library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 

entity ImprovedNanoprocessorSim is --  Port ( ); 
end ImprovedNanoprocessorSim;
 
architecture Behavioral of ImprovedNanoprocessorSim is 

component ImprovedNanoprocessor is 
Port (NanoClock : in STD_LOGIC;
       Reset : in STD_LOGIC;
       FourLED : out STD_LOGIC_VECTOR (3 downto 0);
       SevenSegment : out STD_LOGIC_VECTOR (6 downto 0);
       OverflowLED_Add : out STD_LOGIC;
       ZeroLED : out STD_LOGIC ;
       Anode : out STD_LOGIC_VECTOR (3 downto 0);
       
      OverflowLED_Mul : out STD_LOGIC;
      AgreaterB : out STD_LOGIC; 
      AequalB : out STD_LOGIC; 
      AlessB : out STD_LOGIC 
       );
end component; 

signal reset , zeroled , overflowled_add, overflowled_mul : STD_LOGIC; 

signal A_greater_than_B,A_equal_B,A_less_than_B  : STD_LOGIC; 

signal fourled :STD_LOGIC_VECTOR (3 downto 0); 
signal sevensegment :  STD_LOGIC_VECTOR (6 downto 0); 
signal anode : STD_LOGIC_VECTOR (3 downto 0); 
signal nanoclock :std_logic:='1'; 

begin 

uut : ImprovedNanoprocessor port map ( 
   NanoClock => nanoclock ,
   Reset => reset ,
   FourLED => fourled,
   SevenSegment => sevensegment ,
   OverflowLED_Add => overflowled_add,
   ZeroLED => zeroled ,
   Anode => anode,
  OverflowLED_Mul => overflowled_mul,
  AgreaterB => A_greater_than_B , 
  AequalB  => A_equal_B,
  AlessB   => A_less_than_B  ); 


process begin 
nanoclock <= NOT nanoclock; 
wait for 3ns; 
end process; 


process 
begin 
    Reset <='1'; 
    wait for 100ns; 
    Reset <='0'; 
    wait;
end process; 

end Behavioral; 





