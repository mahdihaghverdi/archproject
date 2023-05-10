-- half_subber_process_tb.vhd

library ieee;
use ieee.std_logic_1164.all;


entity half_subber_process_tb is
end half_subber_process_tb;

architecture tb of half_subber_process_tb is
    signal a, b : std_logic;
    signal diff, borrow : std_logic;
begin
    -- connecting testbench signals with half_subber.vhd
    UUT : entity work.half_subber port map (a => a, b => b, diff => diff, borrow => borrow);

    tb1 : process
        constant period: time := 20 ns;
        begin
            a <= '0';
            b <= '0';
            wait for period;
            assert ((diff = '0') and (borrow = '0'))  -- expected output
            -- error will be reported if diff or borrow is not 0
            report "test failed for input combination 00" severity error;

            a <= '0';
            b <= '1';
            wait for period;
            assert ((diff = '1') and (borrow = '1'))
            report "test failed for input combination 01" severity error;

            a <= '1';
            b <= '0';
            wait for period;
            assert ((diff = '1') and (borrow = '0'))
            report "test failed for input combination 10" severity error;

            a <= '1';
            b <= '1';
            wait for period;
            assert ((diff = '0') and (borrow = '0'))
            report "test failed for input combination 11" severity error;

            assert false report "all tests passed." severity note;
            wait; -- indefinitely suspend process
        end process;
end tb;
