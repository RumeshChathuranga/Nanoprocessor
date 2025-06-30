library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TwoWay3Bit_MUXSim is
-- Testbench has no ports
end TwoWay3Bit_MUXSim;

architecture Behavioral of TwoWay3Bit_MUXSim is

    -- Component declaration for the Unit Under Test (UUT)
    component TwoWay3Bit_MUX
        Port ( 
            In0 : in STD_LOGIC_VECTOR (2 downto 0);
            In1 : in STD_LOGIC_VECTOR (2 downto 0);
            S0 : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

    -- Signals for the testbench
    signal In0_tb : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal In1_tb : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal S0_tb : STD_LOGIC := '0';
    signal Y_tb : STD_LOGIC_VECTOR(2 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: TwoWay3Bit_MUX
        Port map (
            In0 => In0_tb,
            In1 => In1_tb,
            S0 => S0_tb,
            Y => Y_tb
        );

    -- Test process
    stim_proc: process
    begin
        -- Test case 1: S0 = '0', expect Y = In0
        In0_tb <= "110";  -- Example value
        In1_tb <= "001";  -- Example value
        S0_tb <= '0';
        wait for 100 ns;
        
        In0_tb <= "111";
        In1_tb <= "001";
        S0_tb <= '0';
        wait for 100 ns;

        In0_tb <= "101";
        In1_tb <= "001";
        S0_tb <= '0';
        wait for 100 ns;
                                          
                                          --220233 : 110 101 110 001 001 001 
                                          --220030 : 110 101 101 101 111 110 
        In0_tb <= "101";
        In1_tb <= "110";
        S0_tb <= '1';
        wait for 100 ns;
                
        In0_tb <= "010";
        In1_tb <= "101";
        S0_tb <= '1';
        wait for 100 ns;
                        
        In0_tb <= "010";
        In1_tb <= "111";
        S0_tb <= '1';
        wait for 100 ns;
        
        wait;
    end process;
    
  
           
end Behavioral;
