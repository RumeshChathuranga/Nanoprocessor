----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/20/2025 10:06:03 AM
-- Design Name: 
-- Module Name: AU_7_Seg_Sim - Behavioral
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

entity AU_7_Seg_Sim is
--  Port ( );
end AU_7_Seg_Sim;

architecture Behavioral of AU_7_Seg_Sim is
component AU_7_seg
 Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           RegSel : in STD_LOGIC;
           S_LED : out STD_LOGIC_VECTOR (3 downto 0);
           S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           Carry : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Anode : out STD_LOGIC_VECTOR(3 downto 0));
end component;
 
signal s_led,a : STD_LOGIC_VECTOR (3 downto 0):="0000"; 
signal regsel,clk,zero,carry:STD_LOGIC:='0'; 
signal anode : STD_LOGIC_VECTOR (3 downto 0); 
signal s_7seg : STD_LOGIC_VECTOR (6 downto 0); 



begin
UUT:AU_7_seg 
PORT MAP( 
A=>a, 
S_LED=>s_led, 
S_7Seg=>s_7seg, 
RegSel => regsel, 
Clk => clk, 
Zero => zero , 
Carry => carry, 
Anode=>anode 
); 

process  
begin 
clk <= NOT(clk); 
wait for 2ns; 
end process; 

process
begin

a<="1111"; 
wait for 100ns; 
regsel<='1'; 
a<="0001"; 
wait for 100ns; 
RegSel<='0'; 
A<="0001"; 
wait for 100ns; 
regsel<='1'; 
a<="1110"; 
wait;

end process;


end Behavioral;


