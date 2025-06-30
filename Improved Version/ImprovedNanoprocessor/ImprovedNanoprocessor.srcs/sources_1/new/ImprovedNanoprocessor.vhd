library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values

entity ImprovedNanoprocessor is
    Port ( NanoClock : in STD_LOGIC;
           Reset : in STD_LOGIC;
           FourLED : out STD_LOGIC_VECTOR (3 downto 0);
           SevenSegment : out STD_LOGIC_VECTOR (6 downto 0);
           OverflowLED_Add : out STD_LOGIC;
           ZeroLED : out STD_LOGIC ;
           Anode : out STD_LOGIC_VECTOR (3 downto 0);
           
           OverflowLED_Mul : out STD_LOGIC;
           AgreaterB : out STD_LOGIC; 
           AequalB : out STD_LOGIC; 
           AlessB : out STD_LOGIC 
           );
           
end ImprovedNanoprocessor;

architecture Behavioral of ImprovedNanoprocessor is

--#######################################################################################################
Component Slow_Clk 
PORT( Clk_in  : in STD_LOGIC; 
      Clk_out : out STD_LOGIC); 
end Component;

--#####################################################################################################


component ImprovedRegisterBank is
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
end component;

--#####################################################################################################

component SixteenWay4BitMUX is
    Port (
        In0, In1, In2, In3, In4, In5, In6, In7,In8, In9, In10, In11, In12, In13, In14, In15 : in STD_LOGIC_VECTOR(3 downto 0);
        Reg_sel : in STD_LOGIC_VECTOR (3 downto 0); -- 4-bit selector
        Y       : out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

--##################################################################################################################################

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

component ImprovedInstructionDecoder is
    Port ( InstructionBus : in STD_LOGIC_VECTOR (15 downto 0);
           RegValueForCheck : in STD_LOGIC_VECTOR (3 downto 0);
           JumpFlag : out STD_LOGIC;
           JumpAddress : out STD_LOGIC_VECTOR (3 downto 0);
           AddSubSelect : out STD_LOGIC;
           RegSelect1 : out STD_LOGIC_VECTOR (3 downto 0);
           RegSelect2 : out STD_LOGIC_VECTOR (3 downto 0);
           ImmediateValue : out STD_LOGIC_VECTOR (3 downto 0);
           LoadSelect : out STD_LOGIC_VECTOR(3 downto 0);
           RegEN : out STD_LOGIC_VECTOR (3 downto 0);
           OperationSelectorKey : out STD_LOGIC_VECTOR(3 downto 0));
end component;

--###########################################################################################################

component ImprovedProgramROM is
    Port ( MemorySelect : in STD_LOGIC_VECTOR (3 downto 0); -- 4-bit memory selector
           InstructionBus : out STD_LOGIC_VECTOR (15 downto 0) -- 14-bit instruction bus
    );
end component;

--########################################################################################################################
component ImprovedPC is
    Port ( PCIn    : in  STD_LOGIC_VECTOR(3 downto 0);
           PCOut   : out STD_LOGIC_VECTOR(3 downto 0);
           Reset   : in  STD_LOGIC;
           PCClock : in  STD_LOGIC);
end component;
--#########################################################################################################

component Improved4BitAdder is
    Port (
        A4BA   : in  STD_LOGIC_VECTOR(3 downto 0);
        O4BA   : out STD_LOGIC_VECTOR(3 downto 0));
end component;

--#######################################################################################################
component NineWay4Bit_MUX is
    Port (
        In0, In1, In2, In3, In4, In5, In6, In7, In8 : in  STD_LOGIC_VECTOR(3 downto 0);
        Sel   : in  STD_LOGIC_VECTOR(3 downto 0);  -- can represent 0 to 8
        Y     : out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

--########################################################################################################

COMPONENT LUT_16_7 
PORT( address : in STD_LOGIC_VECTOR (3 downto 0); 
        data  : out STD_LOGIC_VECTOR (6 downto 0)); 
end COMPONENT; 

--########################################################################################################
component Multiplier_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow_Mul : out std_logic
           );
end component;
--########################################################################################################
component BitShifterLeft is
    Port (
        A : in STD_LOGIC_VECTOR (3 downto 0);  -- Input 4-bit vector
        Y : out STD_LOGIC_VECTOR (3 downto 0) -- Output 4-bit vector
    );
end component;
--########################################################################################################
component BitShifterRight is
    Port (
        A : in STD_LOGIC_VECTOR (3 downto 0);  -- Input 4-bit vector
        Y : out STD_LOGIC_VECTOR (3 downto 0) -- Output 4-bit vector
    );
end component;
--########################################################################################################
component BitwiseAND is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           X : out STD_LOGIC_VECTOR (3 downto 0));
end component;
--########################################################################################################
component BitwiseNOT is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           X : out STD_LOGIC_VECTOR (3 downto 0));
end component;
--########################################################################################################
component BitwiseOR is
Port (     A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           X : out STD_LOGIC_VECTOR (3 downto 0));
end component;
--########################################################################################################
component BitwiseXOR is
Port (     A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           X : out STD_LOGIC_VECTOR (3 downto 0));
end component;
--########################################################################################################
component Comparator_4bit is
port(
        A : in STD_LOGIC_vector(3 downto 0);         -- Input bit A
        B : in STD_LOGIC_vector(3 downto 0 );         -- Input bit B
        A_equals_B : out STD_LOGIC; -- Output for A = B
        A_greater_B : out STD_LOGIC; -- Output for A > B
        A_less_B : out STD_LOGIC   -- Output for A < B
    );
end Component;
--#####################################################################################################

component OperationSelector is
    Port (
      OutputMux    : in  STD_LOGIC_VECTOR(3 downto 0);
      SelectOpr    : in  STD_LOGIC_VECTOR(3 downto 0);
      ToAddSub     : out STD_LOGIC_VECTOR(3 downto 0);
      ToMul        : out STD_LOGIC_VECTOR(3 downto 0);
      ToComp       : out STD_LOGIC_VECTOR(3 downto 0);
      ToAND        : out STD_LOGIC_VECTOR(3 downto 0);
      ToOR         : out STD_LOGIC_VECTOR(3 downto 0);
      ToNOT        : out STD_LOGIC_VECTOR(3 downto 0);
      ToXOR        : out STD_LOGIC_VECTOR(3 downto 0);
      ToBitShifterLeft : out STD_LOGIC_VECTOR(3 downto 0);
      ToBitShifterRight : out STD_LOGIC_VECTOR(3 downto 0));
end component;

--###########################################################################################################

---------------------------------------------------------------
---------------------- Defining Signals------------------------

signal clkout_to_components : std_logic; 

SIGNAL D_0,D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9,D_10,D_11,D_12,D_13,D_14,D_15 : STD_LOGIC_VECTOR (3 downto 0);  --Data Busses
signal bank_data_in : std_logic_vector(3 downto 0);
signal bank_reg_en_from_instruction_decoder : std_logic_vector(3 downto 0);

signal sixteenway4bit_mux_out_0,sixteenway4bit_mux_out_1 : std_logic_vector(3 downto 0); --Bus inputs for 4bit add/sub unit
signal regselect1, regselect2 : std_logic_vector(3 downto 0);

signal loadselector : std_logic_vector(3 downto 0) ;

signal addsubselector : std_logic ;
signal overflowledadd, overflowledmul : std_logic ;

signal opr_selection_key_0 : std_logic_vector(3 downto 0);

signal instructions : std_logic_vector(15 downto 0);
signal memoryselector : std_logic_vector(3 downto 0);

signal twoway4bit_mux_out : std_logic_vector(3 downto 0);

signal four_bit_adder_out : std_logic_vector(3 downto 0);
signal jumpingaddress : std_logic_vector(3 downto 0);
signal jumpingflag : std_logic; 

signal toaddsubA,tomulA,tocompA,toandA,toorA,tonotA,toxorA,toshiftlA,toshiftrA : std_logic_vector(3 downto 0);
signal toaddsubB,tomulB,tocompB,toandB,toorB,toxorB,toshiftlB,toshiftrB,tonotB : std_logic_vector(3 downto 0);

signal addsubOUT,mulOUT,compOUT,andOUT,orOUT,notOUT,xorOUT,shiftlOUT,shiftrOUT : std_logic_vector(3 downto 0);

signal nineway4bit_mux_in8 : std_logic_vector(3 downto 0);




begin

Processor_Clock_0 : Slow_Clk 
port map (
   Clk_in  => NanoClock , -- put nanoclock in constraints file
   Clk_out  => clkout_to_components);

Improved_register_bank : ImprovedRegisterBank 
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
           BankOut7 => D_7,
           BankOut8 => D_8,
          BankOut9 => D_9,
          BankOut10 => D_10,
          BankOut11 => D_11,
          BankOut12 => D_12,
          BankOut13 => D_13,
          BankOut14 => D_14,
          BankOut15 => D_15);

SixteenWay4Bit_MUX_0 : SixteenWay4BitMUX 
    Port map(
       In0=> D_0, 
       In1=> D_1, 
       In2=> D_2,
       In3 => D_3,
       In4=> D_4, 
       In5=> D_5,
       In6=> D_6,
       In7=> D_7, 
       In8=> D_8, 
       In9=> D_9, 
       In10=> D_10,
       In11 => D_11,
       In12=> D_12, 
       In13=> D_13,
       In14=> D_14,
       In15=> D_15, 
       Reg_sel=> regselect1,
       Y => sixteenway4bit_mux_out_0 );

SixteenWay4Bit_MUX_1 : SixteenWay4BitMUX 
    Port map(
       In0=> D_0, 
       In1=> D_1, 
       In2=> D_2,
       In3 => D_3,
       In4=> D_4, 
       In5=> D_5,
       In6=> D_6,
       In7=> D_7, 
       In8=> D_8, 
       In9=> D_9, 
       In10=> D_10,
       In11 => D_11,
       In12=> D_12, 
       In13=> D_13,
       In14=> D_14,
       In15=> D_15, 
       Reg_sel=> regselect2,
       Y => sixteenway4bit_mux_out_1 );
       
nineway_mux : NineWay4Bit_MUX 
           Port map(
               In0 => addsubOUT, 
               In1=> mulOUT,
               In2=> andOUT, 
               In3=> orOUT, 
               In4=> notOUT, 
               In5=> xorOUT, 
               In6=> shiftrOUT, 
               In7=> shiftlOUT, 
               In8=> nineway4bit_mux_in8,
               Sel=> loadselector,
               Y  => bank_data_in );
               
asu_0 :  ASU 
           Port map ( AAddSub => toaddsubA,
                    BAddSub => toaddsubB,
                    AddSubSelect => addsubselector, 
                    OAddSub => addsubOUT,
                    Overflow => overflowledadd ,
                    Zero => zeroLED );
                    
improved_instruction_decoder : ImprovedInstructionDecoder 
            Port map( InstructionBus => instructions ,
                   RegValueForCheck  => sixteenway4bit_mux_out_0 ,
                   JumpFlag          => jumpingflag ,
                   JumpAddress       => jumpingaddress,
                   AddSubSelect      => addsubselector,
                   RegSelect1        => regselect1,
                   RegSelect2        => regselect2,
                   ImmediateValue    => nineway4bit_mux_in8,
                   LoadSelect        => loadselector,
                   RegEN             => bank_reg_en_from_instruction_decoder,
                   OperationSelectorKey => opr_selection_key_0 );


improved_rom : ImprovedProgramROM   
    Port map( MemorySelect => memoryselector,
              InstructionBus  => instructions);


imporved_pc_0 : ImprovedPC 
      Port map ( PCIn   => twoway4bit_mux_out,
                 PCOut  => memoryselector ,
                 Reset  => Reset,
                 PCClock => clkout_to_components );
                 

improved_4ba_0 : Improved4BitAdder 
     Port map ( A4BA => memoryselector,
                O4BA => four_bit_adder_out);          


next_address_select : TwoWay4Bit_Mux
port map( In0 => four_bit_adder_out,
          In1 => jumpingaddress,
          S0 =>jumpingflag, 
          Y => twoway4bit_mux_out ); 


 seven_segment : LUT_16_7 
        Port map( address => D_7 , 
                  data    => SevenSegment ); 
                  

 multiplier :Multiplier_4 
    Port map ( A => tomulA ,
           B =>tomulB ,
           Y => mulOUT,
           Overflow_Mul => overflowledmul);


bit_left : BitShifterLeft 
    Port map (
        A => toshiftlA,
        Y => shiftlOUT
    );
    
bit_right : BitShifterRight 
        Port map (
            A => toshiftrA,
            Y => shiftrOUT
        );

bit_and : BitwiseAND
        Port map (
            A => toandA,
            B => toandB,
            X => andOUT
        );
        
bit_not : BitwiseNOT 
        Port map (
            A => tonotA,
            X => notOUT
        );


bit_or : BitwiseOR
        Port map (
        A => toorA,
        B => toorB,
        X => orOUT
    );
    
bit_xor : BitwiseXOR
        Port map (
            A => toxorA,
            B => toxorB,
            X => xorOUT
        );
        
comparator : Comparator_4bit
    port map(
        A => tocompA,
        B =>tocompB,
        A_equals_B => AequalB,
        A_greater_B =>AgreaterB,
        A_less_B => AlessB
    );
        
opr_selector_0 : OperationSelector 
        Port map (
          OutputMux      => sixteenway4bit_mux_out_0,
          SelectOpr      => opr_selection_key_0,
          ToAddSub       => toaddsubA,
          ToMul          => tomulA,
          ToComp         => tocompA,
          ToAND          => toandA,
          ToOR           => toorA,
          ToNOT          => tonotA,
          ToXOR          => toxorA,
          ToBitShifterLeft  => toshiftlA,
          ToBitShifterRight => toshiftrA);

opr_selector_1 : OperationSelector 
        Port map (
          OutputMux      => sixteenway4bit_mux_out_1,
          SelectOpr      =>opr_selection_key_0,
          ToAddSub       => toaddsubB,
          ToMul          =>tomulB,
          ToComp         =>tocompB,
          ToAND          =>toandB,
          ToOR           =>toorB,
          ToNOT          =>tonotB,
          ToXOR          =>toxorB,
          ToBitShifterLeft  => toshiftlB, --hard coded to 0000 for one input operations
          ToBitShifterRight => toshiftrB);
        




FourLED <= D_7 ; 
OverflowLED_Add <= overflowledadd ;
OverflowLED_Mul <= overflowledmul ;
Anode <= "1110";  

end Behavioral;
