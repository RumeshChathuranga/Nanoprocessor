library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BitShifterLeft is
    Port (
        A : in STD_LOGIC_VECTOR (3 downto 0);  -- Input 4-bit vector
        Y : out STD_LOGIC_VECTOR (3 downto 0) -- Output 4-bit vector
    );
end BitShifterLeft;

architecture Behavioral of BitShifterLeft is
begin
    -- Shift left by 1 bit
    Y <= A(2 downto 0) & '0';  -- Concatenate the lower 3 bits of A with '0'
end Behavioral;
