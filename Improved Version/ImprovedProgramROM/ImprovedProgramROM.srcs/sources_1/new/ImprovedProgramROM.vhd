library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity ImprovedProgramROM is
    Port ( MemorySelect : in STD_LOGIC_VECTOR (3 downto 0); -- 4-bit memory selector
           InstructionBus : out STD_LOGIC_VECTOR (15 downto 0) -- 14-bit instruction bus
    );
end ImprovedProgramROM;

architecture Behavioral of ImprovedProgramROM is

    -- ROM array to store 16 14-bit instructions
    type rom_type is array (0 to 15) of std_logic_vector(15 downto 0);
    signal program_ROM : rom_type := (
        "1011010000000001", -- MOVI R7, 1
        "1001000000000010", -- MOVI R2, 2          -- please reenter the program with correct opcodes
        "0011010100000000", -- ADD R7, R2
        "1001010000000011", -- MOVI R3, 3
        "0011010101000000", -- ADD R7, R3
        "1100000000000011", -- JZR R0, 3
        "1100000000000100", -- JZR R0, 4
        "1100000000000101", -- JZR R0, 5
        "1011010000000001", -- MOVI R7, 1
        "1001000000000010", -- MOVI R2, 2
        "0011010100000000", -- ADD R7, R2
        "1001010000000011", -- MOVI R3, 3
        "0011010101000000", -- ADD R7, R3
        "1100000000000011", -- JZR R0, 3
        "1100000000000100", -- JZR R0, 4
        "1100000000000101" -- JZR R0, 5    
      
        );

begin

    -- Map the InstructionBus to the selected ROM entry
    InstructionBus <= program_ROM(to_integer(unsigned(MemorySelect)));

end Behavioral;
