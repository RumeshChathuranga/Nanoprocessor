
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity LUT_16_7 is
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end LUT_16_7;

architecture Behavioral of LUT_16_7 is

type rom_type is array (0 to 15) of std_logic_vector(6 downto 0); 
signal sevenSegment_ROM : rom_type := ( 
"1000000", -- 0 
"1111001",
"0100100",
"0110000",
"0011001",
"0010010",
"0000010",
"1111000",
"0000000",
"0010000",
"0001000", -- a 
"0000011",
"1000110",
"0100001",
"0000110",
"0001110"  -- f 
); 

begin

data <= sevenSegment_ROM(to_integer(unsigned(address)));

end Behavioral;
