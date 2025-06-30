library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity EightWay4Bit_MUX is
    Port (
        In0, In1, In2, In3, In4, In5, In6, In7 : in STD_LOGIC_VECTOR(3 downto 0);
        Reg_sel : in STD_LOGIC_vector(2 downto 0); 
        Y       : out STD_LOGIC_VECTOR(3 downto 0)
    );
end EightWay4Bit_MUX;

architecture Behavioral of EightWay4Bit_MUX is
    signal reg_select : std_logic_vector(2 downto 0);
begin

    -- Correct concurrent signal assignment
    reg_select <= Reg_sel;

    process(reg_select, In0, In1, In2, In3, In4, In5, In6, In7)
    begin
        case reg_select is
            when "000" => Y <= In0;
            when "001" => Y <= In1;
            when "010" => Y <= In2;
            when "011" => Y <= In3;
            when "100" => Y <= In4;
            when "101" => Y <= In5;
            when "110" => Y <= In6;
            when "111" => Y <= In7;
            when others => Y <= (others => '0'); -- Safe default
        end case;
    end process;

end Behavioral;
