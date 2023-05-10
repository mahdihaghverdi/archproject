library ieee;
use ieee.std_logic_1164.all;

entity full_subber is
    port(
        a , b, borrow_in: in std_logic;
        diff, borrow_out : out std_logic
    );
end full_subber;

architecture arch of full_subber is
    component half_subber is
        port(
            a, b : in std_logic;
            diff, borrow : out std_logic
        );
    end component;

    for half_subber_0: half_subber use entity work.half_subber;
    for half_subber_1: half_subber use entity work.half_subber;
    signal adb, anab, anabi : std_logic;

begin
    half_subber_0: half_subber port map (
        a => a,
        b => b,
        diff => adb,
        borrow => anab
    );
    half_subber_1: half_subber port map (
        A => adb,
        B => borrow_in,
        diff => diff,
        borrow => anabi
    );

    borrow_out <= anab or anabi;
end arch;
