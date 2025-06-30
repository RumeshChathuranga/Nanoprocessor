library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--#######################################################################################################

entity nanoprocessor is
    Port ( NanoClock : in STD_LOGIC;
           Reset : in STD_LOGIC;
           FourLED : out STD_LOGIC_VECTOR (3 downto 0);
           SevenSegment : out STD_LOGIC_VECTOR (6 downto 0);
           OverflowLED : out STD_LOGIC;
           ZeroLED : out STD_LOGIC ;
           Anode : out STD_LOGIC_VECTOR (3 downto 0));
end nanoprocessor;
architecture Behavioral of nanoprocessor is

--#######################################################################################################
Component Slow_Clk 
PORT( Clk_in  : in STD_LOGIC; 
      Clk_out : out STD_LOGIC); 
end Component;



--#######################################################################################################
component RegisterBank is
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
end component;

--#######################################################################################################

component EightWay4Bit_MUX is
    Port (
        In0, In1, In2, In3, In4, In5, In6, In7 : in STD_LOGIC_VECTOR(3 downto 0);
        Reg_sel : in STD_LOGIC_VECTOR (2 downto 0); 
        Y       : out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

--#######################################################################################################

component ASU is
    Port ( AAddSub : in STD_LOGIC_VECTOR (3 downto 0);
           BAddSub : in STD_LOGIC_VECTOR (3 downto 0);
           AddSubSelect : in STD_LOGIC;
           OAddSub : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end component;

--#######################################################################################################

component TwoWay4Bit_Mux is
    Port ( In0 : in STD_LOGIC_VECTOR (3 downto 0);
           In1 : in STD_LOGIC_VECTOR (3 downto 0);
           S0 : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

--#######################################################################################################

component InstructionDecoder is
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
end component;

--#######################################################################################################

component LUT_8_12 is --this is programROM
    Port ( MemorySelect : in STD_LOGIC_VECTOR (2 downto 0);
           InstructionBus : out STD_LOGIC_VECTOR (11 downto 0));
end component;

--#######################################################################################################

component PC is
    Port ( PCIn : in STD_LOGIC_VECTOR (2 downto 0);
           PCOut : out STD_LOGIC_VECTOR (2 downto 0);
           Reset : in STD_LOGIC;
           PCClock : in STD_LOGIC);
end component;

--#######################################################################################################

component ThreeBA is
    Port ( AThreeBA : in STD_LOGIC_VECTOR (2 downto 0);
           OThreeBA : out STD_LOGIC_VECTOR (2 downto 0));
end component;

--#######################################################################################################

component TwoWay3Bit_MUX is
    Port ( In0 : in STD_LOGIC_VECTOR (2 downto 0);
           In1 : in STD_LOGIC_VECTOR (2 downto 0);
           S0 : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end component;

--#######################################################################################################
-- Seven Segment 
COMPONENT LUT_16_7 
PORT( address : in STD_LOGIC_VECTOR (3 downto 0); 
        data  : out STD_LOGIC_VECTOR (6 downto 0)); 
end COMPONENT; 



---------------------- Defining Signals------------------------

signal clkout_to_components : std_logic; 

SIGNAL D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7 : STD_LOGIC_VECTOR (3 downto 0);  --Data Busses
signal bank_data_in : std_logic_vector(3 downto 0);

signal eightway4bit_mux_out_0,eightway4bit_mux_out_1 : std_logic_vector(3 downto 0); --Bus inputs for 4bit add/sub unit
signal regselect1, regselect2 : std_logic_vector(2 downto 0);

signal bank_reg_en_from_instruction_decoder : std_logic_vector(2 downto 0);

signal twoway4bit_mux_in1, twoway4bit_mux_in2 : std_logic_vector(3 downto 0);
signal addsubselector : std_logic ;
signal overflow, zero : std_logic ;

signal loadselector : std_logic ;
signal instructions : std_logic_vector(11 downto 0); -- 11BIT instruction Bus

signal jumpingflag : std_logic;
signal jumpingaddress : std_logic_vector(2 downto 0);

signal three_bit_adder_out : std_logic_vector(2 downto 0);
signal twoway3bit_mux_out : std_logic_vector(2 downto 0);

signal memoryselector : std_logic_vector(2 downto 0);


begin

Processor_Clock_0 : Slow_Clk 
port map (
   Clk_in  => NanoClock , -- put nanoclock in constraints file
   Clk_out  => clkout_to_components);
     

Register_bank : RegisterBank 
    Port map ( BankIn => bank_data_in ,
           BankClock => clkout_to_components,
           BankReset => Reset,  -- mapped to RESET button of whole processor
           BankRegEn => bank_reg_en_from_instruction_decoder,
           BankOut0 => D_0,
           BankOut1 => D_1,
           BankOut2 => D_2,
           BankOut3 => D_3,
           BankOut4 => D_4,
           BankOut5 => D_5,
           BankOut6 => D_6,
           BankOut7 => D_7);

           
EightWay4Bit_MUX_0 : EightWay4Bit_MUX 
    Port map(
       In0=> D_0, 
       In1=> D_1, 
       In2=> D_2,
       In3 => D_3,
       In4=> D_4, 
       In5=> D_5,
       In6=> D_6,
       In7=> D_7, 
       Reg_sel=> RegSelect1,
       Y => eightway4bit_mux_out_0 );
       
EightWay4Bit_MUX_1 : EightWay4Bit_MUX 
           Port map (
              In0=> D_0, 
              In1=> D_1, 
              In2=> D_2,
              In3 => D_3,
              In4=> D_4, 
              In5=> D_5,
              In6=> D_6,
              In7=> D_7, 
              Reg_sel => RegSelect2,
              Y => eightway4bit_mux_out_1);
                      

          
twoway4bit : TwoWay4Bit_Mux 
     Port map( In0 =>twoway4bit_mux_in1,
                In1 => twoway4bit_mux_in2 ,
                S0  => loadselector ,
                Y   => bank_data_in );

 asu_0 :  ASU 
    Port map ( AAddSub => eightway4bit_mux_out_0,
             BAddSub => eightway4bit_mux_out_1,
             AddSubSelect => addsubselector, 
             OAddSub => twoway4bit_mux_in1,
             Overflow => overflow ,
             Zero => zero );

instruction_decoder : InstructionDecoder 
    Port map( InstructionBus => instructions ,
           RegValueForCheck  => eightway4bit_mux_out_0 ,
           JumpFlag          => jumpingflag ,
           JumpAddress       => jumpingaddress,
           AddSubSelect      => addsubselector,
           RegSelect1        => regselect1,
           RegSelect2        => regselect2,
           ImmediateValue    => twoway4bit_mux_in2,
           LoadSelect        => loadselector,
           RegEN             => bank_reg_en_from_instruction_decoder );
           
 lut_0 : LUT_8_12 
       Port map( MemorySelect => memoryselector,
              InstructionBus  => instructions);
    
pc_0 : PC 
      Port map ( PCIn   => twoway3bit_mux_out,
                 PCOut  => memoryselector ,
                 Reset  => Reset,
                 PCClock => clkout_to_components );
             
threeba_0 : ThreeBA 
     Port map ( AThreeBA => memoryselector,
                OThreeBA => three_bit_adder_out);
 
 twoway3bit_mux_0 : TwoWay3Bit_MUX 
    Port map ( In0 => three_bit_adder_out,
               In1 => jumpingaddress, 
               S0 => jumpingflag, 
               Y =>  twoway3bit_mux_out);

 
 
 seven_segment : LUT_16_7 
        Port map( address => D_7 , 
                  data    => SevenSegment ); 
               


FourLED <= D_7 ; 
OverflowLED <= overflow;
ZeroLED <=zero;
Anode <= "1110";  
                
          
           

end Behavioral;