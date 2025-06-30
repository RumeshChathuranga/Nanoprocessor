
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Comparator_4bit is
port(
        A : in STD_LOGIC_vector(3 downto 0);         -- Input bit A
        B : in STD_LOGIC_vector(3 downto 0 );         -- Input bit B
        A_equals_B : out STD_LOGIC; -- Output for A = B
        A_greater_B : out STD_LOGIC; -- Output for A > B
        A_less_B : out STD_LOGIC   -- Output for A < B
    );
end Comparator_4bit;

architecture Behavioral of Comparator_4bit is

signal x0, x1, x2, x3 : std_logic; 

begin
x0 <=A(0) xnor B(0);
x1 <=A(1) xnor B(1);
x2 <=A(2) xnor B(2);
x3 <=A(3) xnor B(3);
 
-- Equality (A = B)
    A_equals_B <= x3 and x2 and x1 and x0;

    -- Greater than (A > B)
    A_greater_B <= (A(3) and (not B(3))) or (x3 and A(2) and (not B(2))) or(x3 and x2 and A(1) and (not B(1))) or (x3 and x2 and x1 and A(0) and (not B(0))) ;

    -- Less than (A < B)
    A_less_B <= (B(3) and (not A(3))) or (x3 and B(2) and (not A(2))) or(x3 and x2 and B(1) and (not A(1))) or (x3 and x2 and x1 and B(0) and (not A(0))) ;
    
end Behavioral;
