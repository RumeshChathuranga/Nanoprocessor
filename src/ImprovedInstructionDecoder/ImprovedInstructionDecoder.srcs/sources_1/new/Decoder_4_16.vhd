library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Decoder_4_to_12 is
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (11 downto 0));
end Decoder_4_to_12;

architecture Behavioral of Decoder_4_to_12 is

begin

    -- Decode the inputs to one-hot output if enable is high
    Y(0)  <= NOT(I(0)) AND NOT(I(1)) AND NOT(I(2)) AND NOT(I(3)) AND EN;
    Y(1)  <= I(0) AND NOT(I(1)) AND NOT(I(2)) AND NOT(I(3)) AND EN;
    Y(2)  <= NOT(I(0)) AND I(1) AND NOT(I(2)) AND NOT(I(3)) AND EN;
    Y(3)  <= I(0) AND I(1) AND NOT(I(2)) AND NOT(I(3)) AND EN;
    Y(4)  <= NOT(I(0)) AND NOT(I(1)) AND I(2) AND NOT(I(3)) AND EN;
    Y(5)  <= I(0) AND NOT(I(1)) AND I(2) AND NOT(I(3)) AND EN;
    Y(6)  <= NOT(I(0)) AND I(1) AND I(2) AND NOT(I(3)) AND EN;
    Y(7)  <= I(0) AND I(1) AND I(2) AND NOT(I(3)) AND EN;
    Y(8)  <= NOT(I(0)) AND NOT(I(1)) AND NOT(I(2)) AND I(3) AND EN;
    Y(9)  <= I(0) AND NOT(I(1)) AND NOT(I(2)) AND I(3) AND EN;
    Y(10) <= NOT(I(0)) AND I(1) AND NOT(I(2)) AND I(3) AND EN;
    Y(11) <= I(0) AND I(1) AND NOT(I(2)) AND I(3) AND EN;
    

end Behavioral;
