--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;

---- Testbench for OperationSelector
--entity OperationSelectorSim is
----  No ports
--end OperationSelectorSim;

--architecture Behavioral of OperationSelectorSim is

--    -- Component declaration for the Unit Under Test (UUT)
--    component OperationSelector
--        Port (
--            OutputMux    : in  STD_LOGIC_VECTOR(3 downto 0);
--            SelectOpr    : in  STD_LOGIC_VECTOR(3 downto 0);
--            ToAddSub     : out STD_LOGIC_VECTOR(3 downto 0);
--            ToMul        : out STD_LOGIC_VECTOR(3 downto 0);
--            ToBitShifter : out STD_LOGIC_VECTOR(3 downto 0);
--            ToComp       : out STD_LOGIC_VECTOR(3 downto 0);
--            ToAND        : out STD_LOGIC_VECTOR(3 downto 0);
--            ToOR         : out STD_LOGIC_VECTOR(3 downto 0);
--            ToNOT        : out STD_LOGIC_VECTOR(3 downto 0);
--            ToXOR        : out STD_LOGIC_VECTOR(3 downto 0)
--        );
--    end component;

--    -- Signals to drive inputs and capture outputs
--    signal OutputMux_sig    : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
--    signal SelectOpr_sig    : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
--    signal ToAddSub_sig     : STD_LOGIC_VECTOR(3 downto 0);
--    signal ToMul_sig        : STD_LOGIC_VECTOR(3 downto 0);
--    signal ToBitShifter_sig : STD_LOGIC_VECTOR(3 downto 0);
--    signal ToComp_sig       : STD_LOGIC_VECTOR(3 downto 0);
--    signal ToAND_sig        : STD_LOGIC_VECTOR(3 downto 0);
--    signal ToOR_sig         : STD_LOGIC_VECTOR(3 downto 0);
--    signal ToNOT_sig        : STD_LOGIC_VECTOR(3 downto 0);
--    signal ToXOR_sig        : STD_LOGIC_VECTOR(3 downto 0);

--begin

--    -- Instantiate the OperationSelector
--    UUT: OperationSelector
--        port map (
--            OutputMux    => OutputMux_sig,
--            SelectOpr    => SelectOpr_sig,
--            ToAddSub     => ToAddSub_sig,
--            ToMul        => ToMul_sig,
--            ToBitShifter => ToBitShifter_sig,
--            ToComp       => ToComp_sig,
--            ToAND        => ToAND_sig,
--            ToOR         => ToOR_sig,
--            ToNOT        => ToNOT_sig,
--            ToXOR        => ToXOR_sig
--        );

--    -- Stimulus process
--    stim_proc: process
--    begin
--        -- Test Add/Sub (0000 and 0001)
--        OutputMux_sig <= "1100";  -- sample data
        
--        SelectOpr_sig <= "0000";
--        wait for 50 ns;
--        SelectOpr_sig <= "0001";
--        wait for 50 ns;

--        -- Test Multiply (0100)
        
--        SelectOpr_sig <= "0100";
--        wait for 50 ns;

--        -- Test Complement (0101)
        
--        SelectOpr_sig <= "0101";
--        wait for 50 ns;

--        -- Test AND    (0110)
        
--        SelectOpr_sig <= "0110";
--        wait for 50 ns;

--        -- Test OR     (0111)
        
--        SelectOpr_sig <= "0111";
--        wait for 50 ns;

--        -- Test NOT    (1000)
        
--        SelectOpr_sig <= "1000";
--        wait for 50 ns;

--        -- Test XOR    (1001)
        
--        SelectOpr_sig <= "1001";
--        wait for 50 ns;

--        -- Test Shift  (1010 and 1011)
        
--        SelectOpr_sig <= "1010";
--        wait for 50 ns;
--        SelectOpr_sig <= "1011";
--        wait for 50 ns;

--        -- Test OTHERS: no output should change
       
--        SelectOpr_sig <= "1111";
--        wait for 50 ns;

--        -- End simulation
--        wait;
--    end process;

--end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Testbench for OperationSelector
entity OperationSelectorSim is
end OperationSelectorSim;

architecture Behavioral of OperationSelectorSim is

    -- Component declaration for the Unit Under Test (UUT)
    component OperationSelector
        Port (
            OutputMux          : in  STD_LOGIC_VECTOR(3 downto 0);
            SelectOpr          : in  STD_LOGIC_VECTOR(3 downto 0);
            ToAddSub           : out STD_LOGIC_VECTOR(3 downto 0);
            ToMul              : out STD_LOGIC_VECTOR(3 downto 0);
            ToComp             : out STD_LOGIC_VECTOR(3 downto 0);
            ToAND              : out STD_LOGIC_VECTOR(3 downto 0);
            ToOR               : out STD_LOGIC_VECTOR(3 downto 0);
            ToNOT              : out STD_LOGIC_VECTOR(3 downto 0);
            ToXOR              : out STD_LOGIC_VECTOR(3 downto 0);
            ToBitShifterLeft   : out STD_LOGIC_VECTOR(3 downto 0);
            ToBitShifterRight  : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    -- Signals
    signal OutputMux_sig        : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal SelectOpr_sig        : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal ToAddSub_sig         : STD_LOGIC_VECTOR(3 downto 0);
    signal ToMul_sig            : STD_LOGIC_VECTOR(3 downto 0);
    signal ToComp_sig           : STD_LOGIC_VECTOR(3 downto 0);
    signal ToAND_sig            : STD_LOGIC_VECTOR(3 downto 0);
    signal ToOR_sig             : STD_LOGIC_VECTOR(3 downto 0);
    signal ToNOT_sig            : STD_LOGIC_VECTOR(3 downto 0);
    signal ToXOR_sig            : STD_LOGIC_VECTOR(3 downto 0);
    signal ToBitShifterLeft_sig : STD_LOGIC_VECTOR(3 downto 0);
    signal ToBitShifterRight_sig: STD_LOGIC_VECTOR(3 downto 0);

begin

    -- Instantiate the UUT
    UUT: OperationSelector
        port map (
            OutputMux          => OutputMux_sig,
            SelectOpr          => SelectOpr_sig,
            ToAddSub           => ToAddSub_sig,
            ToMul              => ToMul_sig,
            ToComp             => ToComp_sig,
            ToAND              => ToAND_sig,
            ToOR               => ToOR_sig,
            ToNOT              => ToNOT_sig,
            ToXOR              => ToXOR_sig,
            ToBitShifterLeft   => ToBitShifterLeft_sig,
            ToBitShifterRight  => ToBitShifterRight_sig
        );

    -- Stimulus process
    stim_proc: process
    begin
        OutputMux_sig <= "1100";  -- Sample input

        SelectOpr_sig <= "0000"; wait for 50 ns;
        SelectOpr_sig <= "0001"; wait for 50 ns;
        SelectOpr_sig <= "0100"; wait for 50 ns;
        SelectOpr_sig <= "0101"; wait for 50 ns;
        SelectOpr_sig <= "0110"; wait for 50 ns;
        SelectOpr_sig <= "0111"; wait for 50 ns;
        SelectOpr_sig <= "1000"; wait for 50 ns;
        SelectOpr_sig <= "1001"; wait for 50 ns;
        SelectOpr_sig <= "1010"; wait for 50 ns;
        SelectOpr_sig <= "1011"; wait for 50 ns;
        SelectOpr_sig <= "1111"; wait for 50 ns;  -- Invalid input

        wait;
    end process;

end Behavioral;
