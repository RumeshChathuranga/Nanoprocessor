library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TwoWay4Bit_Mux_Testbench is
end TwoWay4Bit_Mux_Testbench;

architecture Behavioral of TwoWay4Bit_Mux_Testbench is
    -- Component Declaration for the Unit Under Test (UUT)
    component TwoWay4Bit_Mux is
        Port (
            In0 : in STD_LOGIC_VECTOR (3 downto 0);
            In1 : in STD_LOGIC_VECTOR (3 downto 0);
            S0  : in STD_LOGIC;
            Y   : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    -- Signals for the testbench
    signal In1_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal In2_tb : STD_LOGIC_VECTOR (3 downto 0);
    signal S0_tb  : STD_LOGIC;
    signal Y_tb   : STD_LOGIC_VECTOR (3 downto 0);

begin
    -- Instantiate the Unit Under Test (UUT)
    UUT: TwoWay4Bit_Mux
        port map (
            In0 => In1_tb,
            In1 => In2_tb,
            S0  => S0_tb,
            Y   => Y_tb
        );

    -- Stimulus Process
    process
    begin
        -- Test Case 1: S0 = '0', Y should equal In1
        In1_tb <= "0001";
        In2_tb <= "1010";
        S0_tb <= '0';
        wait for 20 ns;

        -- Test Case 2: S0 = '1', Y should equal In2
        S0_tb <= '1';
        wait for 20 ns;

        -- Test Case 3: Change In1 and verify S0 = '0'
        In1_tb <= "1100";
        S0_tb <= '0';
        wait for 20 ns;

        -- Test Case 4: Change In2 and verify S0 = '1'
        In2_tb <= "0110";
        S0_tb <= '1';
        wait for 20 ns;

        -- Test Case 5: Both inputs the same, verify behavior
        In1_tb <= "1111";
        In2_tb <= "1111";
        S0_tb <= '0';
        wait for 20 ns;
        S0_tb <= '1';
        wait for 20 ns;

        -- End Simulation
        wait;
    end process;

end Behavioral;
