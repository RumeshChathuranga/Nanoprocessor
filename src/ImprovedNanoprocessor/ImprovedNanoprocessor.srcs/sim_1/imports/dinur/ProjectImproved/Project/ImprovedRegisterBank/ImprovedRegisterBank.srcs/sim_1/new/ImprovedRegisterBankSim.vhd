library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ImproverRegisterBankSim is
end ImproverRegisterBankSim;

architecture Behavioral of ImproverRegisterBankSim is

    component ImprovedRegisterBank is
        Port (
            BankIn : in STD_LOGIC_VECTOR (3 downto 0);
            BankClock : in STD_LOGIC;
            BankReset : in STD_LOGIC;
            BankRegEn : in STD_LOGIC_VECTOR (3 downto 0); -- 4-bit enable
            BankOut0 : out STD_LOGIC_VECTOR (3 downto 0);
            BankOut1 : out STD_LOGIC_VECTOR (3 downto 0);
            BankOut2 : out STD_LOGIC_VECTOR (3 downto 0);
            BankOut3 : out STD_LOGIC_VECTOR (3 downto 0);
            BankOut4 : out STD_LOGIC_VECTOR (3 downto 0);
            BankOut5 : out STD_LOGIC_VECTOR (3 downto 0);
            BankOut6 : out STD_LOGIC_VECTOR (3 downto 0);
            BankOut7 : out STD_LOGIC_VECTOR (3 downto 0);
            BankOut8 : out STD_LOGIC_VECTOR (3 downto 0);
            BankOut9 : out STD_LOGIC_VECTOR (3 downto 0);
            BankOut10 : out STD_LOGIC_VECTOR (3 downto 0);
            BankOut11 : out STD_LOGIC_VECTOR (3 downto 0);
            BankOut12 : out STD_LOGIC_VECTOR (3 downto 0);
            BankOut13 : out STD_LOGIC_VECTOR (3 downto 0);
            BankOut14 : out STD_LOGIC_VECTOR (3 downto 0);
            BankOut15 : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    signal bankin : STD_LOGIC_VECTOR(3 downto 0);
    signal bankclock : STD_LOGIC := '0';  -- Clock signal
    signal bankregen : STD_LOGIC_VECTOR(3 downto 0); -- Memory Selector
    signal bankreset : STD_LOGIC; -- Reset signal
    signal bankout0, bankout1, bankout2, bankout3 : STD_LOGIC_VECTOR(3 downto 0);
    signal bankout4, bankout5, bankout6, bankout7 : STD_LOGIC_VECTOR(3 downto 0);
    signal bankout8, bankout9, bankout10, bankout11 : STD_LOGIC_VECTOR(3 downto 0);
    signal bankout12, bankout13, bankout14, bankout15 : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- Instantiate the RegisterBank
    UUT : ImprovedRegisterBank
        port map (
            BankIn => bankin,
            BankClock => bankclock,
            BankReset => bankreset,
            BankRegEn => bankregen,
            BankOut0 => bankout0,
            BankOut1 => bankout1,
            BankOut2 => bankout2,
            BankOut3 => bankout3,
            BankOut4 => bankout4,
            BankOut5 => bankout5,
            BankOut6 => bankout6,
            BankOut7 => bankout7,
            BankOut8 => bankout8,
            BankOut9 => bankout9,
            BankOut10 => bankout10,
            BankOut11 => bankout11,
            BankOut12 => bankout12,
            BankOut13 => bankout13,
            BankOut14 => bankout14,
            BankOut15 => bankout15
        );

    -- Clock process
    ClockProcess : process
    begin
        wait for 5 ns;
        bankclock <= NOT(bankclock);
    end process;

    -- Simulation process
    SimulationProcess : process
    begin
        -- Initial Reset
        bankin <= "0101"; 
        bankreset <= '1';
        wait for 100 ns;
        
        bankreset <= '0';

        bankregen <= "0000";
        wait for 50 ns;
        
        bankregen <= "0001";
        wait for 50 ns;
        
        bankregen <= "0010";
        wait for 50 ns;
        
        bankregen <= "0011";
        wait for 50 ns;

        bankregen <= "0100";
        wait for 50 ns;
        bankregen <= "0101";
        wait for 50 ns;
 
        bankregen <= "0110";
        wait for 50 ns;
        bankregen <= "0111";
        wait for 50 ns;
      
        bankregen <= "1000";
        wait for 50 ns;
        
        bankregen <= "1001";
        wait for 50 ns;
        
        bankregen <= "1010";
        wait for 50 ns;
        
        bankregen <= "1011";
        wait for 50 ns;

        bankregen <= "1100";
        wait for 50 ns;
        bankregen <= "1101";
        wait for 50 ns;
 
        bankregen <= "1110";
        wait for 50 ns;
        bankregen <= "1111";
        wait for 50 ns;
        -- Final Reset
        bankreset <= '1';
        wait;

    end process;

end Behavioral;

