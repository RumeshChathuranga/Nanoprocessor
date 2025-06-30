----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2025 10:52:27 AM
-- Design Name: 
-- Module Name: Slow_Clk_Sim - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Slow_Clk_Sim is
--  Port ( );
end Slow_Clk_Sim;


architecture Behavioral of Slow_Clk_Sim is
component Slow_Clk
port ( Clk_in : in STD_LOGIC;
     Clk_out : out STD_LOGIC 
);

end component;

SIGNAL clk_out : std_logic;
 SIGNAL clk_in : std_logic := '0';

begin

UUT : Slow_Clk PORT MAP(
        Clk_in => clk_in,
        Clk_out => clk_out
    );

process
    begin
        for i in 0 to 50000000  loop
            clk_in <= not clk_in;
            wait for 5ns;
        end loop;
        wait;
    end process;
   

 
   

end Behavioral;