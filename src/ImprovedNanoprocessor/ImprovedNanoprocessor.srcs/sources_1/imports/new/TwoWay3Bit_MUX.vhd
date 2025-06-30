
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity TwoWay3Bit_MUX is
    Port ( In0 : in STD_LOGIC_VECTOR (2 downto 0); --take this(In0) as input to MUX from 3 bit addder 
           In1 : in STD_LOGIC_VECTOR (2 downto 0); -- take this as the JUMP ADDRESS input to MUX 
           S0 : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end TwoWay3Bit_MUX;

architecture Behavioral of TwoWay3Bit_MUX is

begin

 Y <= In0 when S0 = '0' else In1;

end Behavioral;
