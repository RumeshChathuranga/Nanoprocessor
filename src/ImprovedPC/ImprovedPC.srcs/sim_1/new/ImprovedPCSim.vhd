library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ImprovedPCSim is
end ImprovedPCSim;

architecture Behavioral of ImprovedPCSim is

component ImprovedPC
    port (
        PCIn : in STD_LOGIC_VECTOR (3 downto 0);
        PCClock : in STD_LOGIC;
        Reset : in STD_LOGIC;
        PCOut : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;

signal pcclock : std_logic := '0';  
signal reset : std_logic;  
signal pcin : std_logic_vector(3 downto 0) := "0000"; 
signal pcout : std_logic_vector(3 downto 0);  

begin

UUT: ImprovedPC
    port map (
        PCClock => pcclock,  
        Reset => reset,  
        PCOut => pcout,  
        PCIn => pcin 
    );

-- Clock generation
process
begin
    pcclock <= not pcclock; 
    wait for 5 ns; 
end process;

-- Stimulus process
process
begin   
    reset <= '1';  
    pcin <= "0000";  
    wait for 50 ns;  
    pcin <= "0001"; 
    wait for 50 ns;  
    pcin <= "0010"; 
    wait for 50 ns;  
    pcin <= "0011"; 
    wait for 50 ns;  
    pcin <= "0101"; 
    wait for 50 ns;  
    pcin <= "0110"; 
    wait for 50 ns;  
    pcin <= "0111"; 
    wait for 50 ns;  

    reset <= '0';  
    pcin <= "1000";  
    wait for 50 ns;  
    pcin <= "1001"; 
    wait for 50 ns;  
    pcin <= "1010"; 
    wait for 50 ns;  
    pcin <= "1011"; 
    wait for 50 ns;  
    pcin <= "1100"; 
    wait for 50 ns;  
    pcin <= "1110"; 
    wait for 50 ns;  
    pcin <= "1111"; 
    wait;  
end process;

end Behavioral;
