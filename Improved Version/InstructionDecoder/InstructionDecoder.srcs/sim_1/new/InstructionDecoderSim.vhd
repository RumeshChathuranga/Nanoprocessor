----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/09/2025 11:01:26 AM
-- Design Name: 
-- Module Name: InstructionDecoderSim - Behavioral
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

entity InstructionDecoderSim is
--  Port ( );
end InstructionDecoderSim;

architecture Behavioral of InstructionDecoderSim is

component InstructionDecoder is
    Port ( InstructionBus : in STD_LOGIC_VECTOR (11 downto 0);
           RegValueForCheck : in STD_LOGIC_VECTOR (3 downto 0);
           JumpFlag : out STD_LOGIC;
           JumpAddress : out STD_LOGIC_VECTOR (2 downto 0);
           AddSubSelect : out STD_LOGIC;
           RegSelect1 : out STD_LOGIC_VECTOR (2 downto 0);
           RegSelect2 : out STD_LOGIC_VECTOR (2 downto 0);
           ImmediateValue : out STD_LOGIC_VECTOR (3 downto 0);
           LoadSelect : out STD_LOGIC;
           RegEN : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal instructionbus : STD_LOGIC_VECTOR (11 downto 0); 
signal regvalueforcheck, immediatevalue : STD_LOGIC_VECTOR (3 downto 0); 
signal regselect1, regselect2, regen, jumpaddress : STD_LOGIC_VECTOR 
(2 downto 0); 
signal addsubselect, jumpflag,loadselect : STD_LOGIC;


begin

UUT : InstructionDecoder port map(
     InstructionBus => instructionbus, 
      RegValueForCheck => regvalueforcheck ,
      JumpFlag => jumpflag,
      JumpAddress=> jumpaddress,
      AddSubSelect => addsubselect, 
      RegSelect1 => regselect1, 
      RegSelect2=> regselect2,
      ImmediateValue => immediatevalue,
      LoadSelect =>  loadselect,
      RegEN => regen
);



process 
begin --220233 : 0011 0101 1100 0100 1001 

regvalueforcheck<="0011"; 
instructionbus<="101110000001";  
wait for 100ns ;

regvalueforcheck <="0101"; 
instructionbus<="100100000010";  
wait for 100ns;  

regvalueforcheck<="0100"; 
instructionbus<="001110100000";  
wait for 100ns; 

regvalueforcheck<="1001"; 
instructionbus<="100110000011";  
wait for 100ns;  

regvalueforcheck<="0000"; 
instructionbus<="100010000101";  
wait for 100ns; 

regvalueforcheck<="0001"; 
instructionbus<="101010000001";  
wait; 
end process; 

end Behavioral; 
