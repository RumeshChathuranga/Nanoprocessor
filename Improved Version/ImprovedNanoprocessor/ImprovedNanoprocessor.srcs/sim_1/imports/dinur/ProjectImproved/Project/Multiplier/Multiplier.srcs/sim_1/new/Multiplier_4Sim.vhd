library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplier_4Sim is
-- No ports for the testbench
end Multiplier_4Sim;

architecture Behavioral of Multiplier_4Sim is
    -- Component declaration for the DUT (Device Under Test)
    component Multiplier_4 is
        Port (
            A : in STD_LOGIC_VECTOR (3 downto 0);
            B : in STD_LOGIC_VECTOR (3 downto 0);
            Y : out STD_LOGIC_VECTOR (3 downto 0);
            Overflow_Mul : out STD_LOGIC
        );
    end component;

    -- Signals to connect to the DUT
    signal A, B : STD_LOGIC_VECTOR(3 downto 0);
    signal Y : STD_LOGIC_VECTOR(3 downto 0);
    signal Overflow_Mul : STD_LOGIC;

begin
    -- Instantiate the DUT
    DUT: Multiplier_4
        Port map (
            A => A,
            B => B,
            Y => Y,
            Overflow_Mul => Overflow_Mul
        );

    -- Stimulus process
    process
    begin
        -- Test Case 1: 3 * 2 = 6
        A <= "0011";  -- 3
        B <= "0010";  -- 2
        wait for 50 ns;

        -- Test Case 2: 7 * 5 = 35
        A <= "0111";  -- 7
        B <= "0101";  -- 5
        wait for 50 ns;

        -- Test Case 3: 15 * 15 = 225 (Overflow expected)
        A <= "1111";  -- 15
        B <= "1111";  -- 15
        wait for 50 ns;

        -- Test Case 4: 8 * 8 = 64
        A <= "1000";  -- 8
        B <= "1000";  -- 8
        wait for 50 ns;

        -- Test Case 5: 0 * 12 = 0
        A <= "0000";  -- 0
        B <= "1100";  -- 12
        wait for 50 ns;

        -- End simulation
        wait;
    end process;
end Behavioral;
