library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;



entity LUT_8_12 is
    Port ( MemorySelect : in STD_LOGIC_VECTOR (2 downto 0);
           InstructionBus : out STD_LOGIC_VECTOR (11 downto 0));
end LUT_8_12;

architecture Behavioral of LUT_8_12 is

type rom_type is array (0 to 7) of std_logic_vector(11 downto 0); 
signal program_ROM : rom_type := ( 
"101110000001", -- MOVI R7, 1 
"100100000010", -- MOVI R2, 2 
"001110100000", -- ADD R7, R2 
"100110000011", -- MOVI R3, 3 
"001110110000", -- ADD R7, R3 
"110000000111", -- JZR R0, 7 
"110000000111", -- JZR R0, 7 
"110000000111"  -- JZR R0, 7 
); 

begin

InstructionBus <= program_ROM(to_integer(unsigned(MemorySelect)));

end Behavioral;
