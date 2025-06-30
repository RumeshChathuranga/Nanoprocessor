
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ThreeBA is
    Port ( AThreeBA : in STD_LOGIC_VECTOR (2 downto 0);
           OThreeBA : out STD_LOGIC_VECTOR (2 downto 0));
end ThreeBA;

architecture Behavioral of ThreeBA is

component RCA_3 is
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;

           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           
           C_in : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
          
           C_out : out STD_LOGIC);
end component;

signal cout:std_logic;
begin

 RCA_3_0 : RCA_3 
 port map( A0 => AThreeBA(0),
           A1 =>AThreeBA(1),
           A2 =>AThreeBA(2),

           B0 =>'1',
           B1 =>'0',
           B2 =>'0',           
           C_in =>'0',
           S0 =>OThreeBA(0),
           S1 =>OThreeBA(1),
           S2 =>OThreeBA(2),
          
           C_out => cout );


end Behavioral;
