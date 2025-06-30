library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ImprovedProgramROMSim is
    -- Portless entity for simulation
end ImprovedProgramROMSim;

architecture Behavioral of ImprovedProgramROMSim is

    -- Declare the component for ImprovedProgramROM
    component ImprovedProgramROM
        port (
            MemorySelect : in STD_LOGIC_VECTOR (3 downto 0); -- 4-bit memory selector
            InstructionBus : out STD_LOGIC_VECTOR (15 downto 0) -- 14-bit instruction bus
        );
    end component;

    -- Signals to connect to the component
    signal Memory_Select : STD_LOGIC_VECTOR (3 downto 0);
    signal Instruction_Bus : STD_LOGIC_VECTOR (15 downto 0);

begin
    -- Instantiate the ImprovedProgramROM
    UUT: ImprovedProgramROM
        port map(
            MemorySelect => Memory_Select,
            InstructionBus => Instruction_Bus
        );

    -- Process to simulate changing MemorySelect values
    process
    begin
        Memory_Select <= "0000"; -- Access first instruction
        wait for 50 ns;

        Memory_Select <= "0001"; -- Access second instruction
        wait for 50 ns;

        Memory_Select <= "0010"; -- Access third instruction
        wait for 50 ns;

        Memory_Select <= "0011"; -- Access fourth instruction
        wait for 50 ns;

        Memory_Select <= "0100"; -- Access fifth instruction
        wait for 50 ns;

        Memory_Select <= "0101"; -- Access sixth instruction
        wait for 50 ns;

        Memory_Select <= "0110"; -- Access seventh instruction
        wait for 50 ns;

        Memory_Select <= "0111"; -- Access eighth instruction
        wait for 50 ns;

        Memory_Select <= "1000"; -- Access ninth instruction
        wait for 50 ns;

        Memory_Select <= "1001"; -- Access tenth instruction
        wait for 50 ns;

        Memory_Select <= "1010"; -- Access eleventh instruction
        wait for 50 ns;

        Memory_Select <= "1011"; -- Access twelfth instruction
        wait for 50 ns;

        Memory_Select <= "1100"; -- Access thirteenth instruction
        wait for 50 ns;

        Memory_Select <= "1101"; -- Access fourteenth instruction
        wait for 50 ns;

        Memory_Select <= "1110"; -- Access fifteenth instruction
        wait for 50 ns;

        Memory_Select <= "1111"; -- Access sixteenth instruction
        wait;

    end process;

end Behavioral;
