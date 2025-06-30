
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 4-bit Program Counter with Reset and Clock
entity ImprovedPC is
    Port ( PCIn    : in  STD_LOGIC_VECTOR(3 downto 0);
           PCOut   : out STD_LOGIC_VECTOR(3 downto 0);
           Reset   : in  STD_LOGIC;
           PCClock : in  STD_LOGIC);
end ImprovedPC;

architecture Behavioral of ImprovedPC is

    component D_FF is
        Port ( D    : in  STD_LOGIC;
               Res  : in  STD_LOGIC;
               Clk  : in  STD_LOGIC;
               Q    : out STD_LOGIC;
               Qbar : out STD_LOGIC);
    end component D_FF;

begin

    -- Instantiate four D flip-flops for each bit of the PC
    D_FF0 : D_FF
        port map ( D   => PCIn(0),
                   Res => Reset,
                   Clk => PCClock,
                   Q   => PCOut(0) );

    D_FF1 : D_FF
        port map ( D   => PCIn(1),
                   Res => Reset,
                   Clk => PCClock,
                   Q   => PCOut(1) );

    D_FF2 : D_FF
        port map ( D   => PCIn(2),
                   Res => Reset,
                   Clk => PCClock,
                   Q   => PCOut(2)
                    );

    D_FF3 : D_FF
        port map ( D   => PCIn(3),
                   Res => Reset,
                   Clk => PCClock,
                   Q   => PCOut(3)
                   );

end Behavioral;

