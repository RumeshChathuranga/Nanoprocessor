library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity BitwiseAND is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           X : out STD_LOGIC_VECTOR (3 downto 0));
end BitwiseAND;

architecture Behavioral of BitwiseAND is

begin
X<=A AND B;

end behavioral;