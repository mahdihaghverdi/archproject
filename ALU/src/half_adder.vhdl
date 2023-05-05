library ieee;
use ieee.numeric_std.all;

entity half_adder is
    port (
        a, b : in signed (31 downto 0);
        s, c : out signed (31 downto 0)
    );
end half_adder;

architecture habhv of half_adder is

begin
    s <= a xor b;
    c <= a and b;
end habhv;
