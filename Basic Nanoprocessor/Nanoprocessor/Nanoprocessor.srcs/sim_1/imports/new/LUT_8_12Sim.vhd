library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 



entity LUT_8_12Sim is 
    --  Port ( ); 
end LUT_8_12Sim;
 
architecture Behavioral of LUT_8_12Sim is 

component LUT_8_12  
port ( MemorySelect : in STD_LOGIC_VECTOR (2 downto 0); 
       InstructionBus : out STD_LOGIC_VECTOR (11 downto 0)); 
end component; 


signal Memory_Select : STD_LOGIC_VECTOR (2 downto 0); 
signal Instruction_Bus : STD_LOGIC_VECTOR (11 downto 0); 


begin 
UUT: LUT_8_12 
port map( MemorySelect => Memory_Select, 
          InstructionBus => Instruction_Bus); 
process 
begin 
Memory_Select <= "000"; 
wait for 100ns; 
Memory_Select <= "001"; 
wait for 100ns; 
Memory_Select <= "010"; 
wait for 100ns; 
Memory_Select <= "011"; 
wait for 100ns; 
Memory_Select <= "100"; 
wait for 100ns; 
Memory_Select <= "101"; 
wait for 100ns; 
Memory_Select <= "110"; 
wait for 100ns; 
Memory_Select <= "111"; 
wait; 
end process; 
end Behavioral; 
