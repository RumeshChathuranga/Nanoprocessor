library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ASU_Testbench is
-- No ports for testbench
end ASU_Testbench;

architecture Behavioral of ASU_Testbench is

    -- Component Declaration
    component ASU is
        Port ( AAddSub : in STD_LOGIC_VECTOR (3 downto 0);
               BAddSub : in STD_LOGIC_VECTOR (3 downto 0);
               AddSubSelect : in STD_LOGIC;
               OAddSub : out STD_LOGIC_VECTOR (3 downto 0);
               Overflow : out STD_LOGIC;
               Zero : out STD_LOGIC);
    end component;

    -- Signals for Inputs and Outputs
    signal AAddSub_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal BAddSub_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal AddSubSelect_tb : STD_LOGIC;
    signal OAddSub_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal Overflow_tb : STD_LOGIC;
    signal Zero_tb : STD_LOGIC;

begin

    -- Instantiate the Unit Under Test (UUT)
    UUT : ASU
        port map (
            AAddSub => AAddSub_tb,
            BAddSub => BAddSub_tb,
            AddSubSelect => AddSubSelect_tb,
            OAddSub => OAddSub_tb,
            Overflow => Overflow_tb,
            Zero => Zero_tb
        );

    -- Stimulus Process
    Stimulus_Process : process
    begin
        -- Test 1: Add 0011 and 1010
        AAddSub_tb <= "0011"; -- 3
        BAddSub_tb <= "1010"; -- -6
        AddSubSelect_tb <= '0'; -- Addition mode
        wait for 50 ns;

        -- Test 2: Subtract 0011 from 1010
        AAddSub_tb <= "1010"; -- -6
        BAddSub_tb <= "0011"; -- 3
        AddSubSelect_tb <= '1'; -- Subtraction mode
        wait for 50 ns;

        -- Test 3: Input a random vector 1110 0000 1100 1110 1010
        -- To test, feed smaller 4-bit segments sequentially
        AAddSub_tb <= "1110"; -- -2
        BAddSub_tb <= "1010"; -- -6
        AddSubSelect_tb <= '0'; -- Addition mode
        wait for 50 ns;
        
        -- Test 4: negate 0011 
                AAddSub_tb <= "0011"; -- -6
                BAddSub_tb <= "0000"; -- 0 from Register 0
                AddSubSelect_tb <= '1'; -- Subtraction mode
                wait for 50 ns;

        -- End simulation
        wait;
    end process;

end Behavioral;
