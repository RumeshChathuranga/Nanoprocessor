library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BitShifterRight is
    Port (
        A : in STD_LOGIC_VECTOR (3 downto 0);  -- Input 4-bit vector
        Y : out STD_LOGIC_VECTOR (3 downto 0) -- Output 4-bit vector
    );
end BitShifterRight;

architecture Behavioral of BitShifterRight is
begin

    -- Shift right by 1 bit
    Y <= '0' & A(3 downto 1);  -- Concatenate '0' with the upper 3 bits of A
end Behavioral;
