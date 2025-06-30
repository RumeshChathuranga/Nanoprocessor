library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BitwiseORSim is
--  Port ( );
end BitwiseORSim;

architecture Behavioral of BitwiseORSim is
Component BitwiseOR is 
Port (     A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           X : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal A,B,X: STD_LOGIC_VECTOR(3 downto 0);

begin
 UUT :BitwiseOR Port Map(
             A=>A,
             B=>B,
             X=>X);
process 
begin
 A<= "1010";
 B<="1100";
 Wait for 100ns;

 A<= "0110";
 B<="0011";
 Wait for 100ns;

 A<= "1111";
 B<="0000";
 Wait for 100ns;

 A<= "1001";
 B<="0101";
 Wait for 100ns;

 A<= "1110";
 B<="1101";
 Wait ;

 end process;


end Behavioral;
