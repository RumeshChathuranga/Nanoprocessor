library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity LUT_16_7_tb is
-- No ports for testbench
end LUT_16_7_tb;

architecture Behavioral of LUT_16_7_tb is

    -- Component under test
    component LUT_16_7 is
        Port (
            address : in  STD_LOGIC_VECTOR(3 downto 0);
            data    : out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component;

    -- Testbench signals
    signal address_tb : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal data_tb    : STD_LOGIC_VECTOR(6 downto 0);

begin

   
    uut: LUT_16_7
        port map (
            address => address_tb,
            data    => data_tb
        );

    -- Stimulus process
    stim_proc: process
    begin
        for i in 0 to 15 loop
            address_tb <= std_logic_vector(to_unsigned(i, 4));
            wait for 10 ns;
        end loop;
        wait; 
    end process;

end Behavioral;
