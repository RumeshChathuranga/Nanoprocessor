library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OperationSelector is
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
      ToBitShifterRight : out STD_LOGIC_VECTOR(3 downto 0)
      
      
    );
end OperationSelector;

architecture Behavioral of OperationSelector is
begin

  process(OutputMux, SelectOpr)
  begin
    -- 1) Default everything to 'Z' (disconnected)
    ToAddSub     <= (others => 'Z');
    ToMul        <= (others => 'Z');
    ToComp       <= (others => 'Z');
    ToAND        <= (others => 'Z');
    ToOR         <= (others => 'Z');
    ToNOT        <= (others => 'Z');
    ToXOR        <= (others => 'Z');
    ToBitShifterLeft <= (others => 'Z');
    ToBitShifterRight <= (others => 'Z');
    
    -- 2) Drive exactly one port when SelectOpr matches
    case SelectOpr is
      when "0000" | "0001" =>
        ToAddSub <= OutputMux;
      when "0100" =>
        ToMul <= OutputMux;
      when "0101" =>
        ToComp <= OutputMux;
      when "0110" =>
        ToAND <= OutputMux;
      when "0111" =>
        ToOR <= OutputMux;
      when "1000" =>
        ToNOT <= OutputMux;
      when "1001" =>
        ToXOR <= OutputMux;
      when "1010"  =>
        ToBitShifterLeft <= OutputMux;
      when "1011"  =>
        ToBitShifterRight <= OutputMux;
      
      when others =>
        -- leave all outputs at 'Z'
        null;
    end case;
  end process;

end Behavioral;
