library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--  A testbench has no ports.
entity alu_tb is
end alu_tb;

architecture tb of alu_tb is
    signal input_a, input_b : std_logic_vector (3 downto 0);
    signal output           : std_logic_vector (7 downto 0);
    signal carry_borrow_out : std_logic;
    signal sel              : std_logic_vector (1 downto 0);

begin
    UUT : entity work.alu port map (
        alu_input_a => input_a,
        alu_input_b => input_b,
        alu_out => output,
        alu_carry_borrow_out => carry_borrow_out,
        alu_select => sel
    );

    -- aaaa bbbb ss ++++ ---- ******** ````
    -- 0000 0000 00 0000
    -- 0000 0000 01      0000
    -- 0000 0000 10           00000000
    -- 0000 0000 10                    1111

    -- 0100 0010 00 0110
    -- 0100 0010 01      0010
    -- 0100 0010 10           00001000
    -- 0100 0010 11                    1111

    input_a <= "0000", "0100" after 20 ns;
    input_b <= "0000", "0010" after 20 ns;
    sel <= "00", "00" after 20 ns, "01" after 40 ns, "10" after 60 ns, "11" after 80 ns, "11" after 100 ns;
end tb;
