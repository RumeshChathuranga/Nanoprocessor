library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ImprovedInstructionDecoder_tb is
-- Testbench does not have any ports
end ImprovedInstructionDecoder_tb;

architecture Behavioral of ImprovedInstructionDecoder_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component ImprovedInstructionDecoder
        Port ( InstructionBus : in STD_LOGIC_VECTOR (15 downto 0);
               RegValueForCheck : in STD_LOGIC_VECTOR (3 downto 0);
               JumpFlag : out STD_LOGIC;
               JumpAddress : out STD_LOGIC_VECTOR (3 downto 0);
               AddSubSelect : out STD_LOGIC;
               RegSelect1 : out STD_LOGIC_VECTOR (3 downto 0);
               RegSelect2 : out STD_LOGIC_VECTOR (3 downto 0);
               ImmediateValue : out STD_LOGIC_VECTOR (3 downto 0);
               LoadSelect : out STD_LOGIC_VECTOR (3 downto 0);
               RegEN : out STD_LOGIC_VECTOR (3 downto 0);
               OperationSelectorKey : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    -- Signals to connect to the UUT
    signal InstructionBus : STD_LOGIC_VECTOR (15 downto 0);
    signal RegValueForCheck : STD_LOGIC_VECTOR (3 downto 0);
    signal JumpFlag : STD_LOGIC;
    signal JumpAddress : STD_LOGIC_VECTOR (3 downto 0);
    signal AddSubSelect : STD_LOGIC;
    signal RegSelect1 : STD_LOGIC_VECTOR (3 downto 0);
    signal RegSelect2 : STD_LOGIC_VECTOR (3 downto 0);
    signal ImmediateValue : STD_LOGIC_VECTOR (3 downto 0);
    signal LoadSelect : STD_LOGIC_VECTOR (3 downto 0);
    signal RegEN : STD_LOGIC_VECTOR (3 downto 0);
    signal OperationSelectorKey : STD_LOGIC_VECTOR (3 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: ImprovedInstructionDecoder
        Port map (
            InstructionBus => InstructionBus,
            RegValueForCheck => RegValueForCheck,
            JumpFlag => JumpFlag,
            JumpAddress => JumpAddress,
            AddSubSelect => AddSubSelect,
            RegSelect1 => RegSelect1,
            RegSelect2 => RegSelect2,
            ImmediateValue => ImmediateValue,
            LoadSelect => LoadSelect,
            RegEN => RegEN,
            OperationSelectorKey => OperationSelectorKey
        );

    -- Testbench Process
    process
    begin
        -- Test case 1: Basic instruction decode
        InstructionBus <= "0010011100001111"; -- Example MOVI operation
        RegValueForCheck <= "0000";
        wait for 100 ns;

        -- Test case 2: NEG operation with valid registers
        InstructionBus <= "0000101011100000"; -- Example ADD operation
        RegValueForCheck <= "0010";
        wait for 100 ns;

        -- Test case 3: JZR operation with zero register
        InstructionBus <= "0011000000001111"; -- Example JZR operation
        RegValueForCheck <= "0000"; -- Simulate zero register
        wait for 100 ns;

        -- Test case 4: Immediate operation
        InstructionBus <= "0100010000110000"; -- MUL operation
        RegValueForCheck <= "1111";
        wait for 100 ns;

        -- Add additional test cases as needed

        -- End simulation
        wait;
    end process;

end Behavioral;
