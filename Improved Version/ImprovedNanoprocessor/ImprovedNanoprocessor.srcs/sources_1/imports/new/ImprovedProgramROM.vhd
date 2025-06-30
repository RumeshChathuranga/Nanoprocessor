library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity ImprovedProgramROM is
    Port ( MemorySelect : in STD_LOGIC_VECTOR (3 downto 0); -- 4-bit memory selector
           InstructionBus : out STD_LOGIC_VECTOR (15 downto 0) -- 16-bit instruction bus
    );
end ImprovedProgramROM;

architecture Behavioral of ImprovedProgramROM is

    -- ROM array to store 16 16-bit instructions
    type rom_type is array (0 to 15) of std_logic_vector(15 downto 0);
    signal program_ROM : rom_type := (
        "0010011100000001", -- MOVI R7, 1
        "0010000100000001", -- MOVI R1, 1          -- enter the program with correct opcodes
        "0010011100000010", -- MOVI R7, 2
        "0000011100010000", -- ADD R7, R1  (ANSWER 3)
        "0010001000000011", -- MOVI R2, 3
        "0010011100000010", -- MOVI R7, 2
        "0100011100100000", -- MUL R7, R2 (ANSWER 6)
        "0010001100000110", -- MOVI R3, 6
        "0010011100000000", -- MOVI R7, 0000
        "1001011100110000", -- xor R7, R3(ANSWER IS 6 again)
        "0010010100000000", -- MOVI R5,6
        "0010011100000011", -- MOVI R7,3
        "0101011101010000", -- COMP R7, R5 (COMPARISON BETWEEN 3 AND 6 LIGHTS UP less THAN BULB)
        "0010011100000000", -- MOVI R7,0
        "0011000000001111", -- jump R0,15
        "0011000000001110"  -- JUMP R0  ,14
      
        );

begin

    -- Map the InstructionBus to the selected ROM entry
    InstructionBus <= program_ROM(to_integer(unsigned(MemorySelect)));

end Behavioral;
