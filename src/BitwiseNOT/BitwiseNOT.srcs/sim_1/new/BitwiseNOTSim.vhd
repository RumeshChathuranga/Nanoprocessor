library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BitwiseNOTSim is
--  Port ( );
end BitwiseNOTSim;

architecture Behavioral of BitwiseNOTSim is
component  BitwiseNOT is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           X : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal A,X: STD_LOGIC_VECTOR(3 downto 0);
begin
UUT :BitwiseNOT Port Map(
             A=>A,
             X=>X);
 process 
 begin 
 A<= "1010";
 
 Wait for 100ns;
 A<= "0110";

 Wait for 100ns;
 A<= "1111";

 Wait for 100ns;
 A<= "1001";
 Wait for 100ns;
 A<= "1110";

 Wait ;
 end process;
end Behavioral;
