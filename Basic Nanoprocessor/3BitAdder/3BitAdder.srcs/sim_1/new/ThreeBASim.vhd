library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ThreeBASim is
--  Port ( );
end ThreeBASim;


architecture Behavioral of ThreeBASim is
component ThreeBA is
        Port ( AThreeBA : in STD_LOGIC_VECTOR (2 downto 0);
               OThreeBA : out STD_LOGIC_VECTOR (2 downto 0));
    end component;

    -- Signals for Testbench
    signal AThreeBA_tb : STD_LOGIC_VECTOR (2 downto 0);
    signal OThreeBA_tb : STD_LOGIC_VECTOR (2 downto 0);

begin
    -- Instantiate the Unit Under Test (UUT)
    UUT: ThreeBA
        port map (
            AThreeBA => AThreeBA_tb,
            OThreeBA => OThreeBA_tb
        );

    -- Stimulus Process
    process
    begin
        -- Test Case: Add 001 to 000
        AThreeBA_tb <= "000"; -- Input 000
        wait for 50 ns;

        -- Test Case: Add 001 to 001
        AThreeBA_tb <= "001"; -- Input 001
        wait for 50 ns;

        -- Test Case: Add 001 to 010
        AThreeBA_tb <= "010"; -- Input 010
        wait for 50 ns;

        -- Test Case: Add 001 to 011
        AThreeBA_tb <= "011"; -- Input 011
        wait for 50 ns;

        -- Test Case: Add 001 to 100
        AThreeBA_tb <= "100"; -- Input 100
        wait for 50 ns;

        -- Test Case: Add 001 to 101
        AThreeBA_tb <= "101"; -- Input 101
        wait for 50 ns;

        -- Test Case: Add 001 to 110
        AThreeBA_tb <= "110"; -- Input 110
        wait for 50 ns;

        -- Test Case: Add 001 to 111
        AThreeBA_tb <= "111"; -- Input 111
        wait for 50 ns;

        -- End Simulation
        wait;
    end process;

end Behavioral;