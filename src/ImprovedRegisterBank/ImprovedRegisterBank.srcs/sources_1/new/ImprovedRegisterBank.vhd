library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ImprovedRegisterBank is
    Port (
        BankIn : in STD_LOGIC_VECTOR (3 downto 0);
        BankClock : in STD_LOGIC;
        BankReset : in STD_LOGIC;
        BankRegEn : in STD_LOGIC_VECTOR (3 downto 0); -- 4-bit register enable
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
end ImprovedRegisterBank;

architecture Behavioral of ImprovedRegisterBank is

component Reg is
    Port (
        I : in STD_LOGIC_VECTOR (3 downto 0);
        RegClock : in STD_LOGIC;
        RegEn : in STD_LOGIC;
        RegReset : in STD_LOGIC;
        Y : out STD_LOGIC_VECTOR (3 downto 0)
    );
    end component;

    component Decoder_4_to_16 is
        Port (
            I : in STD_LOGIC_VECTOR (3 downto 0);
            Y : out STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;

    signal en : STD_LOGIC_VECTOR(15 downto 0);

begin

    -- Instantiate the 4-to-16 decoder
    Decoder_4_to_16_inst : Decoder_4_to_16
        port map (
            I => BankRegEn,
            Y => en
        );

    -- Instantiate 16 registers
    Reg_0 : Reg port map (I => "0000", RegClock => BankClock, RegEn => en(0), RegReset => BankReset, Y => BankOut0);
    Reg_1 : Reg port map (I => BankIn, RegClock => BankClock, RegEn => en(1), RegReset => BankReset, Y => BankOut1);
    Reg_2 : Reg port map (I => BankIn, RegClock => BankClock, RegEn => en(2), RegReset => BankReset, Y => BankOut2);
    Reg_3 : Reg port map (I => BankIn, RegClock => BankClock, RegEn => en(3), RegReset => BankReset, Y => BankOut3);
    Reg_4 : Reg port map (I => BankIn, RegClock => BankClock, RegEn => en(4), RegReset => BankReset, Y => BankOut4);
    Reg_5 : Reg port map (I => BankIn, RegClock => BankClock, RegEn => en(5), RegReset => BankReset, Y => BankOut5);
    Reg_6 : Reg port map (I => BankIn, RegClock => BankClock, RegEn => en(6), RegReset => BankReset, Y => BankOut6);
    Reg_7 : Reg port map (I => BankIn, RegClock => BankClock, RegEn => en(7), RegReset => BankReset, Y => BankOut7);
    Reg_8 : Reg port map (I => BankIn, RegClock => BankClock, RegEn => en(8), RegReset => BankReset, Y => BankOut8);
    Reg_9 : Reg port map (I => BankIn, RegClock => BankClock, RegEn => en(9), RegReset => BankReset, Y => BankOut9);
    Reg_10 : Reg port map (I => BankIn, RegClock => BankClock, RegEn => en(10), RegReset => BankReset, Y => BankOut10);
    Reg_11 : Reg port map (I => BankIn, RegClock => BankClock, RegEn => en(11), RegReset => BankReset, Y => BankOut11);
    Reg_12 : Reg port map (I => BankIn, RegClock => BankClock, RegEn => en(12), RegReset => BankReset, Y => BankOut12);
    Reg_13 : Reg port map (I => BankIn, RegClock => BankClock, RegEn => en(13), RegReset => BankReset, Y => BankOut13);
    Reg_14 : Reg port map (I => BankIn, RegClock => BankClock, RegEn => en(14), RegReset => BankReset, Y => BankOut14);
    Reg_15 : Reg port map (I => BankIn, RegClock => BankClock, RegEn => en(15), RegReset => BankReset, Y => BankOut15);

end Behavioral;

