library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 4?bit Adder Testbench: Improved4BitAdderSim
entity Improved4BitAdderSim is
-- Testbench has no ports
end Improved4BitAdderSim;

architecture Behavioral of Improved4BitAdderSim is

    -- Unit Under Test declaration
    component Improved4BitAdder
        Port (
            A4BA : in  STD_LOGIC_VECTOR(3 downto 0);
            O4BA : out STD_LOGIC_VECTOR(3 downto 0)
            
        );
    end component;

    -- Signals to connect to the UUT
    signal A4BA_sig   : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal O4BA_sig   : STD_LOGIC_VECTOR(3 downto 0);
    

begin

    -- Instantiate the Improved4BitAdder
    UUT: Improved4BitAdder
        port map (
            A4BA => A4BA_sig,
            O4BA => O4BA_sig);

    -- Stimulus process
    stim_proc: process
    begin
        -- Test increment of 0 => 1
        A4BA_sig <= "0000";
        wait for 50 ns;

        -- Test increment of 1 => 2
        A4BA_sig <= "0001";
        wait for 50 ns;

        -- Test increment of 7 => 8
        A4BA_sig <= "0111";
        wait for 50 ns;

        -- Test increment of 8 => 9
        A4BA_sig <= "1000";
        wait for 50 ns;

        -- Test increment of 14 => 15
        A4BA_sig <= "1110";
        wait for 50 ns;

        -- Test increment of 15 => 0 (with carry?out)
        A4BA_sig <= "1111";
        wait for 50 ns;

        -- End simulation
        wait;
    end process;

end Behavioral;
