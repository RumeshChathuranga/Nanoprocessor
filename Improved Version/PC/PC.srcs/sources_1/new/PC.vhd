
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity PC is
    Port ( PCIn : in STD_LOGIC_VECTOR (2 downto 0);
           PCOut : out STD_LOGIC_VECTOR (2 downto 0);
           Reset : in STD_LOGIC;
           PCClock : in STD_LOGIC);
end PC;

architecture Behavioral of PC is

component D_FF is
    Port ( D : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC);
   
end component;

begin

D_FF0 : D_FF 
    port map ( D => PCIn(0), 
               Res => Reset, 
               Clk => PCClock, 
               Q => PCOut(0));      
    D_FF1 : D_FF 
    port map ( D => PCIn(1), 
               Res => Reset, 
               Clk => PCClock, 
               Q => PCOut(1));               
    D_FF2 : D_FF 
    port map ( D => PCIn(2), 
               Res => Reset, 
               Clk => PCClock, 
               Q => PCOut(2)); 



end Behavioral;
