library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RightBitShiftSim is
    -- No ports for the testbench entity
end RightBitShiftSim;

architecture Behavioral of RightBitShiftSim is

    -- Component Declaration for the Unit Under Test (UUT)
    component BitShifterRight
        Port (
            A : in STD_LOGIC_VECTOR (3 downto 0);
            Y : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    -- Signals for connecting to the UUT
    signal A : STD_LOGIC_VECTOR (3 downto 0);
    signal Y : STD_LOGIC_VECTOR (3 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: BitShifterRight
        Port map (
            A => A,
            Y => Y
        );

    -- Testbench Process
    stim_proc: process
    begin
        -- Test case 1: A = "0000"
        A <= "0000";
        wait for 100 ns;

        -- Test case 2: A = "1001"
        A <= "1001";
        wait for 100 ns;

        -- Test case 3: A = "1111"
        A <= "1111";
        wait for 100 ns;

        -- Test case 4: A = "0101"
        A <= "0101";
        wait for 100 ns;

        -- Stop the simulation
        wait;
    end process;

end Behavioral;
