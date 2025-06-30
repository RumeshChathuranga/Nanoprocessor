----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2025 02:32:06 PM
-- Design Name: 
-- Module Name: AU - Behavioral
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

entity AU is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           RegSel : in STD_LOGIC;
           Clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC;
           Carry : out STD_LOGIC);
end AU;

architecture Behavioral of AU is

component RCA_4 
port (     A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           A3 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           B3 : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           S3 : out STD_LOGIC;
           C_out : out STD_LOGIC);
           
end component;
           
component Reg 
port( D : in STD_LOGIC_VECTOR (3 downto 0);
    Clk : in STD_LOGIC;
     En : in STD_LOGIC;
      Q : out STD_LOGIC_VECTOR (3 downto 0));
      
end component;
    
component Slow_clk
Port ( Clk_in : in STD_LOGIC;
      Clk_out : out STD_LOGIC);
end component;

signal o1, o2,o3 : std_logic_vector(3 downto 0);
signal oc,en1,en2 : std_logic;
signal slow_clk_out : std_logic;

begin

RegA: Reg port map(
    D => A ,
  Clk => slow_clk_out ,
   En => en1,
    Q => o1);

RegB: Reg port map(
    D => A ,
  Clk => slow_clk_out,
   En => en2,
    Q => o2 );
   
Slow_clk0 : slow_clk
port map(
    Clk_in => Clk,
    Clk_out =>  slow_clk_out
);

RCA1 : RCA_4
port map(
   A0 => o1(0),
   A1 => o1(1),
   A2 => o1(2),
   A3 => o1(3),
   B0 => o2(0),
   B1 => o2(1),
   B2 => o2(2),
   B3 => o2(3),
   C_in => '0' ,
   S0 => o3(0) ,
   S1 => o3(1),
   S2 => o3(2),
   S3 => o3(3),
   C_out => oc);
   
en1 <= RegSel;
en2 <= not(RegSel);

S <= o3;
Carry <= oc;

Zero <= not(oc or o3(0)or o3(1)or o3(2)or o3(3));

   
end Behavioral;
