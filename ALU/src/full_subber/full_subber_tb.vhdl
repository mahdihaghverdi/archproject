library ieee;
use ieee.std_logic_1164.all;


entity full_subber_tb is
end full_subber_tb;

architecture tb of full_subber_tb is
    signal a, b, bi : std_logic;  -- inputs
    signal diff, borrow : std_logic;  -- outputs
begin
    -- connecting testbench signals with full_subber.vhdl
    UUT : entity work.full_subber port map (
        a => a,
        b => b,
        borrow_in => bi,
        diff => diff,
        borrow_out => borrow
    );

    -- inputs
    -- bi ba              db
    --  0 00 at   0 ns -> 00
    --  0 01 at  20 ns -> 11
    --  1 01 at  40 ns -> 01
    --  1 11 at  60 ns -> 11

    bi <= '0', '1' after 40 ns, '1' after 60 ns;
    b <= '0', '1' after 60 ns;
    a <= '0', '1' after 20 ns, '1' after 60 ns;
end tb ;
