library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity RegisterBank is
    Port ( BankIn : in STD_LOGIC_VECTOR (3 downto 0);
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
end RegisterBank;

architecture Behavioral of RegisterBank is

component Reg is
     Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
          RegClock : in STD_LOGIC;
          RegEn : in STD_LOGIC;
          RegReset : in STD_LOGIC;
          Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Decoder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC; 
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal en : std_logic_vector(7 downto 0);
begin

Decoder_3_to_8_first : Decoder_3_to_8
port map (
           I => BankRegEn,
           EN => '1',
           Y => en
);


Reg_0 : Reg 
port map(
     I =>"0000" ,
     RegClock=> BankClock ,
     RegEn => '0', 
     RegReset => BankReset ,
     Y => BankOut0 
);

Reg_1 : Reg 
port map(
     I => BankIn,
     RegClock=>BankClock,
     RegEn => en(1), 
     RegReset =>BankReset ,
     Y => BankOut1
); 

Reg_2 : Reg 
port map(
     I =>BankIn,
     RegClock=> BankClock,
     RegEn => en(2), 
     RegReset =>BankReset ,
     Y => BankOut2
); 

Reg_3 : Reg 
port map(
     I => BankIn,
     RegClock=>BankClock ,
     RegEn => en(3), 
     RegReset => BankReset,
     Y => BankOut3
); 
Reg_4 : Reg 
port map(
     I => BankIn,
     RegClock=>BankClock ,
     RegEn => en(4), 
     RegReset =>BankReset ,
     Y => BankOut4
); 

Reg_5 : Reg 
port map(
     I => BankIn,
     RegClock=>BankClock ,
     RegEn => en(5), 
     RegReset =>BankReset ,
     Y => BankOut5
); 

Reg_6 : Reg 
port map(
     I => BankIn,
     RegClock=> BankClock,
     RegEn => en(6), 
     RegReset =>BankReset ,
     Y => BankOut6
); 

Reg_7 : Reg 
port map(
     I => BankIn ,
     RegClock=>BankClock ,
     RegEn => en(7), 
     RegReset => BankReset,
     Y => BankOut7
); 

end Behavioral;
