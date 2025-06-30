library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity InstructionDecoder is
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
end InstructionDecoder;

architecture Behavioral of InstructionDecoder is

component Decoder_2_to_4 is
    Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal add, neg , movi, jzr : std_logic;

begin

Decoder_2_to_4_0 : Decoder_2_to_4 
Port map ( I(0) =>InstructionBus(10), 
I(1) => InstructionBus(11),   
EN   => '1', 
Y(0) => ADD, 
Y(1) => NEG, 
Y(2) => MOVI, 
Y(3) => JZR ); 


RegSelect1   <= InstructionBus(9 downto 7); 
RegSelect2   <= InstructionBus(6 downto 4); 
RegEN        <= InstructionBus(9 downto 7); 
AddSubSelect <= NEG; 
JumpFlag      <= JZR AND ( NOT(RegValueForCheck(0) OR RegValueForCheck(1) OR RegValueForCheck(2) OR RegValueForCheck(3))); 
JumpAddress   <= InstructionBus(2 downto 0); 
LoadSelect    <= MOVI; 
ImmediateValue <= InstructionBus(3 downto 0);



    
end behavioral;
