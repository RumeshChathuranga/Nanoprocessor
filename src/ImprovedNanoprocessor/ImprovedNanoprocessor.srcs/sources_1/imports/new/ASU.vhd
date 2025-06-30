library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ASU is
    Port ( AAddSub : in STD_LOGIC_VECTOR (3 downto 0);
           BAddSub : in STD_LOGIC_VECTOR (3 downto 0);
           AddSubSelect : in STD_LOGIC;
           OAddSub : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC
           );
end ASU;

architecture Behavioral of ASU is

component RCA_4 is
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           A3 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           B3 : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           S3 : out STD_LOGIC;
           C_out : out STD_LOGIC);
end component;

signal b0, b1, b2, b3 :std_logic;
signal s0, s1, s2, s3 :std_logic;
signal cout, overflowRCA : std_logic;

begin

b0<= BAddSub(0) XOR AddSubSelect;
b1<= BAddSub(1) XOR AddSubSelect;
b2<= BAddSub(2) XOR AddSubSelect;
b3<= BAddSub(3) XOR AddSubSelect;

RCA_4_0 : RCA_4  
port map( A0 => AAddSub(0),
          A1 => AAddSub(1),
          A2 => AAddSub(2),
          A3 => AAddSub(3),
          B0 => b0,
          B1 => b1, 
          B2 => b2,
          B3 => b3, 
          C_in => AddSubSelect, 
          S0  => s0,
          S1  => s1,
          S2  => s2,
          S3  => s3,
          C_out => cout
          );

-- Zero Flag  ---check whether normal meyhod have less gates
Zero <= not( s0 or s1 or s2 or  s3);

-- Overflow Flag
Overflow <= cout;

OAddSub(0)<= s0;
OAddSub(1)<= s1;
OAddSub(2)<= s2;
OAddSub(3)<= s3;

end Behavioral;
