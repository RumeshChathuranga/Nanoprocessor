library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 

entity ImprovedInstructionDecoder is
    Port ( InstructionBus : in STD_LOGIC_VECTOR (15 downto 0);
           RegValueForCheck : in STD_LOGIC_VECTOR (3 downto 0);
           JumpFlag : out STD_LOGIC;
           JumpAddress : out STD_LOGIC_VECTOR (3 downto 0);
           AddSubSelect : out STD_LOGIC;
           RegSelect1 : out STD_LOGIC_VECTOR (3 downto 0);
           RegSelect2 : out STD_LOGIC_VECTOR (3 downto 0);
           ImmediateValue : out STD_LOGIC_VECTOR (3 downto 0);
           LoadSelect : out STD_LOGIC_Vector(3 downto 0);
           RegEN : out STD_LOGIC_VECTOR (3 downto 0);
           OperationSelectorKey : out STD_LOGIC_VECTOR(3 downto 0));
end ImprovedInstructionDecoder;

architecture Behavioral of ImprovedInstructionDecoder is

component Decoder_4_to_12 is 
Port ( I : in STD_LOGIC_VECTOR (3 downto 0); 
EN : in STD_LOGIC; 
Y : out STD_LOGIC_VECTOR (11 downto 0)); 
end component; 


signal ADD, NEG, MOVI, JZR, MUL, COMP, BitwiseAND, BitwiseOR, BitwiseNOT, BitwiseXOR, BitShiftLeft, BitShiftRight:STD_LOGIC; 

begin

Decoder_4_to_12_0 : Decoder_4_to_12 
Port map ( I(0) => InstructionBus(12), 
           I(1) => InstructionBus(13), 
           I(2) => InstructionBus(14), 
           I(3) => InstructionBus(15),    
           EN   => '1', 
           Y(0) => ADD, 
           Y(1) => NEG, 
           Y(2) => MOVI, 
           Y(3) => JZR,
           Y(4) => MUL, 
           Y(5) => COMP, 
           Y(6) => BitwiseAND, 
           Y(7) => BitwiseOR,
           Y(8) => BitwiseNOT, 
           Y(9) => BitwiseXOR, 
           Y(10) => BitShiftLeft, 
           Y(11) => BitShiftRight);


RegSelect1   <= InstructionBus(11 downto 8); 
RegSelect2   <= InstructionBus(7 downto 4); 
RegEN        <= InstructionBus(11 downto 8); 
AddSubSelect <= NEG; 
JumpFlag      <= JZR AND ( NOT(RegValueForCheck(0) OR RegValueForCheck(1) OR RegValueForCheck(2) OR RegValueForCheck(3))); 
JumpAddress   <= InstructionBus(3 downto 0); 
LoadSelect    <= InstructionBus(15 downto 12) ; 
ImmediateValue <= InstructionBus(3 downto 0);
OperationSelectorKey <= InstructionBus(15 downto 12);



end Behavioral;
