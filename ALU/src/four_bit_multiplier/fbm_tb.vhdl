library ieee;
use ieee.std_logic_1164.all;


entity FourBitMultiplierTB is
end FourBitMultiplierTB;

architecture tb of FourBitMultiplierTB is
    signal a, b: std_logic_vector (3 downto 0);  -- inputs
    signal output : std_logic_vector (7 downto 0);  -- outputs

begin
    -- connecting testbench signals with 4bitfa.vhdl
    UUT : entity work.FourBitMultiplier port map (
        input_a => a,
        input_b => b,
        output => output
    );

    -- bbbb aaaa    oooooooo
    -- 1101 1011 -> 10001111
    -- 1001 0101 -> 00101101
    -- 1010 1110 -> 10001100

    a <= "0000", "1011" after 20 ns, "0101" after 40 ns, "1110" after 60 ns, "1110" after 80 ns;
    b <= "0000", "1101" after 20 ns, "1001" after 40 ns, "1010" after 60 ns, "1010" after 80 ns;
end tb ;
