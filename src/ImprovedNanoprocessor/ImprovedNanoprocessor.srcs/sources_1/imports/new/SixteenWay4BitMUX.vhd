library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SixteenWay4BitMUX is
    Port (
        In0, In1, In2, In3, In4, In5, In6, In7,In8, In9, In10, In11, In12, In13, In14, In15 : in STD_LOGIC_VECTOR(3 downto 0);
        Reg_sel : in STD_LOGIC_VECTOR (3 downto 0); -- 4-bit selector
        Y       : out STD_LOGIC_VECTOR(3 downto 0)
    );
end SixteenWay4BitMUX;

architecture Behavioral of SixteenWay4BitMUX is
begin
    process(Reg_sel, In0, In1, In2, In3, In4, In5, In6, In7,
            In8, In9, In10, In11, In12, In13, In14, In15)
    begin
        case Reg_sel is
            when "0000" => Y <= In0;
            when "0001" => Y <= In1;
            when "0010" => Y <= In2;
            when "0011" => Y <= In3;
            when "0100" => Y <= In4;
            when "0101" => Y <= In5;
            when "0110" => Y <= In6;
            when "0111" => Y <= In7;
            when "1000" => Y <= In8;
            when "1001" => Y <= In9;
            when "1010" => Y <= In10;
            when "1011" => Y <= In11;
            when "1100" => Y <= In12;
            when "1101" => Y <= In13;
            when "1110" => Y <= In14;
            when "1111" => Y <= In15;
            when others => Y <= (others => '0'); -- Safe default
        end case;
    end process;
end Behavioral;
