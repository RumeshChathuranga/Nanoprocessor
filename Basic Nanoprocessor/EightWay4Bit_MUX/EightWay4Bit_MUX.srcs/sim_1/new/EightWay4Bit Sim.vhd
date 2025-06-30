library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity EightWay4Bit_MUX_tb is
-- No ports for the testbench
end EightWay4Bit_MUX_tb;

architecture Behavioral of EightWay4Bit_MUX_tb is
    -- Component declaration for the DUT (Device Under Test)
    component EightWay4Bit_MUX
        Port (
            In0, In1, In2, In3 : in STD_LOGIC_VECTOR(3 downto 0);
            In4, In5, In6, In7 : in STD_LOGIC_VECTOR(3 downto 0);
            S0 ,S1,S2 : in STD_LOGIC;
            Y                  : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    -- Signals to connect to the DUT
    signal In0, In1, In2, In3, In4, In5, In6, In7 : STD_LOGIC_VECTOR(3 downto 0);
    signal S0, S1, S2                             : STD_LOGIC;
    signal Y                                      : STD_LOGIC_VECTOR(3 downto 0);

begin
    -- Instantiate the DUT
    UUT: EightWay4Bit_MUX
        Port map (
            In0 => In0, In1 => In1, In2 => In2, In3 => In3,
            In4 => In4, In5 => In5, In6 => In6, In7 => In7,
            S0  => S0, S1  => S1, S2  => S2,
            Y   => Y
        );

    -- Stimulus process
    process
    begin
        -- Initialize inputs
        In0 <= "0000"; In1 <= "0001"; In2 <= "0010"; In3 <= "0011";
        In4 <= "0100"; In5 <= "0101"; In6 <= "0110"; In7 <= "0111";

        -- Test each select combination
        S0 <= '0'; S1 <= '0'; S2 <= '0'; wait for 50 ns; -- Expect Y = In0
        S0 <= '1'; S1 <= '0'; S2 <= '0'; wait for 50 ns; -- Expect Y = In1
        S0 <= '0'; S1 <= '1'; S2 <= '0'; wait for 50 ns; -- Expect Y = In2
        S0 <= '1'; S1 <= '1'; S2 <= '0'; wait for 50 ns; -- Expect Y = In3
        S0 <= '0'; S1 <= '0'; S2 <= '1'; wait for 50 ns; -- Expect Y = In4
        S0 <= '1'; S1 <= '0'; S2 <= '1'; wait for 50 ns; -- Expect Y = In5
        S0 <= '0'; S1 <= '1'; S2 <= '1'; wait for 50 ns; -- Expect Y = In6
        S0 <= '1'; S1 <= '1'; S2 <= '1'; wait for 50 ns; -- Expect Y = In7

        -- End simulation
        wait;
    end process;
end Behavioral;
