library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity EightWay4Bit_MUX_tb is
-- No ports for the testbench
end EightWay4Bit_MUX_tb;

architecture Behavioral of EightWay4Bit_MUX_tb is
    
    component EightWay4Bit_MUX
        Port (
            In0, In1, In2, In3 : in STD_LOGIC_VECTOR(3 downto 0);
            In4, In5, In6, In7 : in STD_LOGIC_VECTOR(3 downto 0);
            Reg_sel            : in STD_LOGIC_VECTOR(2 downto 0);
            Y                  : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    -- Signals to connect to the DUT
    signal In0, In1, In2, In3, In4, In5, In6, In7 : STD_LOGIC_VECTOR(3 downto 0);
    signal Reg_sel                               : STD_LOGIC_VECTOR(2 downto 0);
    signal Y                                      : STD_LOGIC_VECTOR(3 downto 0);

begin

    
    UUT: EightWay4Bit_MUX
        Port map (
            In0     => In0, In1 => In1, In2 => In2, In3 => In3,
            In4     => In4, In5 => In5, In6 => In6, In7 => In7,
            Reg_sel => Reg_sel,
            Y       => Y
        );

    -- Stimulus process
    process
    begin
        -- Initialize inputs
        In0 <= "0000"; In1 <= "0001"; In2 <= "0010"; In3 <= "0011";
        In4 <= "0100"; In5 <= "0101"; In6 <= "0110"; In7 <= "0111";

        -- Test each select combination
        Reg_sel <= "000"; wait for 50 ns; -- Expect Y = In0
        Reg_sel <= "001"; wait for 50 ns; -- Expect Y = In1
        Reg_sel <= "010"; wait for 50 ns; -- Expect Y = In2
        Reg_sel <= "011"; wait for 50 ns; -- Expect Y = In3
        Reg_sel <= "100"; wait for 50 ns; -- Expect Y = In4
        Reg_sel <= "101"; wait for 50 ns; -- Expect Y = In5
        Reg_sel <= "110"; wait for 50 ns; -- Expect Y = In6
        Reg_sel <= "111"; wait for 50 ns; -- Expect Y = In7

        wait; 
    end process;

end Behavioral;
