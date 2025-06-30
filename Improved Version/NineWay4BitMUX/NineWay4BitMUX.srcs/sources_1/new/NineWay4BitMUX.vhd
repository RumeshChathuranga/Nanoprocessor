library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 9-way 4-bit multiplexer
entity NineWay4Bit_MUX is
    Port (
        In0, In1, In2, In3, In4, In5, In6, In7, In8 : in  STD_LOGIC_VECTOR(3 downto 0);
        Sel   : in  STD_LOGIC_VECTOR(3 downto 0);  -- can represent 0 to 8
        Y     : out STD_LOGIC_VECTOR(3 downto 0)
    );
end NineWay4Bit_MUX;

architecture Behavioral of NineWay4Bit_MUX is
begin
    process(Sel, In0, In1, In2, In3, In4, In5, In6, In7, In8)
    begin
        case Sel is
            when "0000" => Y <= In0; --add
            when "0001" => Y <= In0; --neg
            when "0100" => Y <= In1; --mul
            when "0110" => Y <= In2; --and
            when "0111" => Y <= In3; --or
            when "1000" => Y <= In4; --not
            when "1001" => Y <= In5; --xor
            when "1011" => Y <= In6; --shift right
            when "1010" => Y <= In7; --shift left
            when "0010" => Y <= In8; -- Immediate value
            when others => Y <= (others => 'Z');  -- safe default
        end case;
    end process;
end Behavioral;
