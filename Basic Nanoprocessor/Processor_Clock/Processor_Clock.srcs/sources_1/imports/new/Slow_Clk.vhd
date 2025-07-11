
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
        Clk_out : out STD_LOGIC);
 end Slow_Clk;
 
 architecture Behavioral of Slow_Clk is
 
 SIGNAL count : integer :=1;
 SIGNAL Clk_status : STD_LOGIC :='0';
 
 begin
 process (Clk_in) begin
 if (rising_edge(Clk_in)) then
    count <= count +1 ;
    if (count = 5) then
    --if (count = 50000000) then
         Clk_status <= NOT (Clk_status);
         Clk_out <= Clk_status ;
         count <= 1;
    end if;
 end if;
 end process;
 
 end Behavioral;