library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Comparator_1bit is
    Port (
        A : in STD_LOGIC;         -- Input bit A
        B : in STD_LOGIC;         -- Input bit B
        A_equals_B : out STD_LOGIC; -- Output for A = B
        A_greater_B : out STD_LOGIC; -- Output for A > B
        A_less_B : out STD_LOGIC   -- Output for A < B
    );
end Comparator_1bit;

architecture behavioural of Comparator_1bit is
    
begin
   
    -- Equality (A = B)
    A_equals_B <= A xnor B ;

    -- Greater than (A > B)
    A_greater_B <= A and (not B);

    -- Less than (A < B)
    A_less_B <= (not A) and B;
    
end behavioural;

