library ieee;
use ieee.std_logic_1164.all;

entity half_subber is
    port(
        a, b: in std_logic;
        diff, borrow : out std_logic
    );
end half_subber;

architecture arch of half_subber is
begin
    diff <= a xor b;
    borrow <= not(a) and b;
end arch;
