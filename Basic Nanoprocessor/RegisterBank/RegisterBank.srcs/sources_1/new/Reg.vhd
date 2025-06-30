library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg is
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           RegClock : in STD_LOGIC;
           RegReset : in STD_LOGIC;
           RegEn : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Reg;

architecture Behavioral of Reg is

begin

  process(RegClock) begin
         if (rising_edge(RegClock)) then -- respond when clock rises
         if RegReset = '1' then
            Y <= "0000";
         elsif RegEn = '1' then -- Enable should be set
            Y <= I;
         end if;
     end if;
end process;




end Behavioral;
