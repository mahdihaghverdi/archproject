library ieee;
use ieee.std_logic_1164.all;


entity half_subber_tb is
end half_subber_tb;

architecture tb of half_subber_tb is
    signal a, b : std_logic;  -- inputs
    signal diff, borrow : std_logic;  -- outputs
begin
    -- connecting testbench signals with half_subber.vhdl
    UUT : entity work.half_subber port map (
        a => a,
        b => b, diff => diff,
        borrow => borrow
    );

    -- inputs
    -- ba             db
    -- 00 at  0 ns -> 00
    -- 01 at 20 ns -> 11
    -- 10 at 40 ns -> 10
    -- 11 at 60 ns -> 00
    -- 11 at 80 ns -> 00

    a <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns, '1' after 80 ns;
    b <= '0', '1' after 40 ns, '1' after 60 ns;
end tb ;
