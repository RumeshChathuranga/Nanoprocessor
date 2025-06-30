library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Simple testbench for NineWay4Bit_MUX using UUT instantiation
entity NineWay4Bit_MUX_tb is
--  No ports
end NineWay4Bit_MUX_tb;

architecture Behavioral of NineWay4Bit_MUX_tb is

    -- Signals for inputs and output
    signal In0_s, In1_s, In2_s, In3_s : STD_LOGIC_VECTOR(3 downto 0);
    signal In4_s, In5_s, In6_s, In7_s : STD_LOGIC_VECTOR(3 downto 0);
    signal In8_s                     : STD_LOGIC_VECTOR(3 downto 0);
    signal Sel_s                     : STD_LOGIC_VECTOR(3 downto 0);
    signal Y_s                       : STD_LOGIC_VECTOR(3 downto 0);

begin

    ----------------------------------------------------------------
    -- Unit Under Test (UUT) instantiation
    ----------------------------------------------------------------
    UUT: entity work.NineWay4Bit_MUX
        port map (
            In0 => In0_s,
            In1 => In1_s,
            In2 => In2_s,
            In3 => In3_s,
            In4 => In4_s,
            In5 => In5_s,
            In6 => In6_s,
            In7 => In7_s,
            In8 => In8_s,
            Sel => Sel_s,
            Y   => Y_s
        );

    ----------------------------------------------------------------
    -- Simple stimulus process
    ----------------------------------------------------------------
    stim_proc: process
    begin
        -- Initialize inputs
            -- Initialize inputs to distinct patterns 0..8
        In0_s <= "0000";  -- 0
        In1_s <= "0101";  -- 1
        In2_s <= "0110";  -- 2
        In3_s <= "0111";  -- 3
        In4_s <= "1000";  -- 4
        In5_s <= "0101";  -- 5
        In6_s <= "0110";  -- 6
        In7_s <= "0101";  -- 7
        In8_s <= "1000";  -- 8


        -- Cycle through a few select values
        Sel_s <= "0000"; wait for 100 ns;  -- expect Y_s = "0000"
        Sel_s <= "0011"; wait for 100 ns;  -- expect Y_s = "0011"
        Sel_s <= "0101"; wait for 100 ns;  -- expect Y_s = "0101"
        Sel_s <= "1000"; wait for 100 ns;  -- expect Y_s = "1000"
        Sel_s <= "1010"; wait for 100 ns;  -- out-of-range, expect "0000"
        wait;
    end process;

end Behavioral;
