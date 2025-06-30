library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ComparatorSim is
-- Testbench has no ports
end ComparatorSim;

architecture behavioral of ComparatorSim is

    component Comparator_4bit
    port(
        A : in STD_LOGIC_VECTOR(3 downto 0);
        B : in STD_LOGIC_VECTOR(3 downto 0);
        A_equals_B : out STD_LOGIC;
        A_greater_B : out STD_LOGIC;
        A_less_B : out STD_LOGIC
    );
    end component;

    -- Signals for connecting to the UUT
    signal A : STD_LOGIC_VECTOR(3 downto 0);
    signal B : STD_LOGIC_VECTOR(3 downto 0);
    signal A_equals_B : STD_LOGIC;
    signal A_greater_B : STD_LOGIC;
    signal A_less_B : STD_LOGIC;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Comparator_4bit
        port map (
            A => A,
            B => B,
            A_equals_B => A_equals_B,
            A_greater_B => A_greater_B,
            A_less_B => A_less_B
        );

    -- Test Process
  process
    begin
        -- Test case 1: A = 0000, B = 0000 (Equal)
        A <= "0000"; B <= "0000";
        wait for 100 ns;

        -- Test case 2: A = 0001, B = 0000 (A > B)
        A <= "0001"; B <= "0000";
        wait for 100 ns;

        -- Test case 3: A = 0000, B = 0001 (A < B)
        A <= "0000"; B <= "0001";
        wait for 100 ns;

        -- Test case 4: A = 1010, B = 0101 (A > B)
        A <= "1010"; B <= "0101";
        wait for 100 ns;

        -- Test case 5: A = 0101, B = 1010 (A < B)
        A <= "0101"; B <= "1010";
        wait for 100 ns;

        -- Test case 6: A = 1111, B = 1111 (Equal)
        A <= "1111"; B <= "1111";
        wait for 100 ns;

        -- Test complete, stop simulation
        wait;
    end process;

end behavioral;
