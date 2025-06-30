library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Improved4BitAdder is
    Port (
        A4BA   : in  STD_LOGIC_VECTOR(3 downto 0);
        O4BA   : out STD_LOGIC_VECTOR(3 downto 0));
end Improved4BitAdder;

architecture Behavioral of Improved4BitAdder is

    -- 4?bit Ripple Carry Adder component
    component RCA_4 is
        Port (
            A0    : in  STD_LOGIC;
            A1    : in  STD_LOGIC;
            A2    : in  STD_LOGIC;
            A3    : in  STD_LOGIC;
            B0    : in  STD_LOGIC;
            B1    : in  STD_LOGIC;
            B2    : in  STD_LOGIC;
            B3    : in  STD_LOGIC;
            C_in  : in  STD_LOGIC;
            S0    : out STD_LOGIC;
            S1    : out STD_LOGIC;
            S2    : out STD_LOGIC;
            S3    : out STD_LOGIC;
            C_out : out STD_LOGIC
        );
    end component;

    signal carryout : STD_LOGIC;

begin

    -- Instantiate the 4?bit adder, adding a constant "0001" (i.e. increment by 1)
    RCA4_0 : RCA_4
        port map (
            A0    => A4BA(0),
            A1    => A4BA(1),
            A2    => A4BA(2),
            A3    => A4BA(3),
            B0    => '1',    -- LSB of constant 1
            B1    => '0',
            B2    => '0',
            B3    => '0',    -- MSB of constant 1
            C_in  => '0',    -- no initial carry?in
            S0    => O4BA(0),
            S1    => O4BA(1),
            S2    => O4BA(2),
            S3    => O4BA(3),
            C_out => carryout );



end Behavioral;
