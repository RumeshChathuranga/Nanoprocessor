library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
entity RegisterBankSim is
--  Port ( );
end RegisterBankSim;

architecture Behavioral of RegisterBankSim is

component RegisterBank is
   port ( BankIn : in STD_LOGIC_VECTOR (3 downto 0);
           BankClock : in STD_LOGIC;
           BankReset : in STD_LOGIC;
           BankRegEn : in STD_LOGIC_VECTOR (2 downto 0);
           BankOut0 : out STD_LOGIC_VECTOR (3 downto 0);
           BankOut1 : out STD_LOGIC_VECTOR (3 downto 0);
           BankOut2 : out STD_LOGIC_VECTOR (3 downto 0);
           BankOut3 : out STD_LOGIC_VECTOR (3 downto 0);
           BankOut4 : out STD_LOGIC_VECTOR (3 downto 0);
           BankOut5 : out STD_LOGIC_VECTOR (3 downto 0);
           BankOut6 : out STD_LOGIC_VECTOR (3 downto 0);
           BankOut7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal bankin : std_logic_vector(3 downto 0); 
signal bankclock : std_logic := '0';  -- Clock signal 
signal bankregen : std_logic_vector(2 downto 0);-- Memory Selector 
signal bankreset : std_logic; -- Reset signal 
signal  bankout0, bankout1,bankout2,bankout3,bankout4,bankout5,bankout6,bankout7 : std_logic_vector(3 downto 0); 


begin

UUT  : RegisterBank port map(
  BankIn => bankin,
  BankClock => bankclock,
  BankReset => bankreset,
  BankRegEN => bankregen,
  BankOut0 => bankout0,
  BankOut1 => bankout1,
  BankOut2 => bankout2,
  BankOut3 => bankout3,
  BankOut4 => bankout4,
  BankOut5 => bankout5,
  BankOut6 => bankout6,
  BankOut7 => bankout7     
);


process begin 

Wait for 20ns; 
bankclock<=NOT(bankclock); 

end process; 


process begin -- Reset activated 

bankreset <= '1'; 
wait for 40 ns; 

bankreset <= '0'; -- Provide input values for each register -- Select different registers 
bankin <= "0101"; 
bankregen <= "000"; -- Select R0 
wait for 40 ns; 

bankregen <= "001"; -- Select R1 
wait for 40 ns; 

bankregen <= "010"; -- Select R2 
wait for 40 ns; 

bankregen<= "011"; -- Select R3 
wait for 40 ns; 

bankregen <= "100"; -- Select R4 
wait for 40 ns; 

bankregen <= "101"; -- Select R5 
wait for 40 ns; 

bankregen <= "110"; -- Select R6 
wait for 40 ns; 

bankregen <= "111"; -- Select R7 
wait for 40ns;

bankreset <= '1';
wait ;

end process; 
end Behavioral;
