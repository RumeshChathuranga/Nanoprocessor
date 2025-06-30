library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SixteenWay4BitMUXSim is
end SixteenWay4BitMUXSim;

architecture Behavioral of SixteenWay4BitMUXSim is
    component SixteenWay4BitMUX
        Port (
            In0, In1, In2, In3, In4, In5, In6, In7,
            In8, In9, In10, In11, In12, In13, In14, In15 : in STD_LOGIC_VECTOR(3 downto 0);
            Reg_sel : in STD_LOGIC_VECTOR (3 downto 0);
            Y       : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    signal In0, In1, In2, In3, In4, In5, In6, In7 : STD_LOGIC_VECTOR(3 downto 0);
    signal In8, In9, In10, In11, In12, In13, In14, In15 : STD_LOGIC_VECTOR(3 downto 0);
    signal Reg_sel : STD_LOGIC_VECTOR(3 downto 0);
    signal Y      : STD_LOGIC_VECTOR(3 downto 0);

begin
    DUT: SixteenWay4BitMUX
        Port map (
            In0 => In0, In1 => In1, In2 => In2, In3 => In3,
            In4 => In4, In5 => In5, In6 => In6, In7 => In7,
            In8 => In8, In9 => In9, In10 => In10, In11 => In11,
            In12 => In12, In13 => In13, In14 => In14, In15 => In15,
            Reg_sel => Reg_sel,
            Y => Y
        );

    process
    begin
        In0  <= "0000"; In1  <= "0001"; In2  <= "0010"; In3  <= "0011";
        In4  <= "0100"; In5  <= "0101"; In6  <= "0110"; In7  <= "0111";
        In8  <= "1000"; In9  <= "1001"; In10 <= "1010"; In11 <= "1011";
        In12 <= "1100"; In13 <= "1101"; In14 <= "1110"; In15 <= "1111";

        Reg_sel <= "0000"; wait for 50 ns;
        Reg_sel <= "0001"; wait for 50 ns;
        Reg_sel <= "0010"; wait for 50 ns;
        Reg_sel <= "0011"; wait for 50 ns;
        Reg_sel <= "0100"; wait for 50 ns;
        Reg_sel <= "0101"; wait for 50 ns;
        Reg_sel <= "0110"; wait for 50 ns;
        Reg_sel <= "0111"; wait for 50 ns;
        Reg_sel <= "1000"; wait for 50 ns;
        Reg_sel <= "1001"; wait for 50 ns;
        Reg_sel <= "1010"; wait for 50 ns;
        Reg_sel <= "1011"; wait for 50 ns;
        Reg_sel <= "1100"; wait for 50 ns;
        Reg_sel <= "1101"; wait for 50 ns;
        Reg_sel <= "1110"; wait for 50 ns;
        Reg_sel <= "1111"; wait for 50 ns;

        wait;
    end process;
end Behavioral;
