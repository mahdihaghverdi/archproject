library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
    port (
        a, b : in std_logic_vector (31 downto 0);
        s, c : out std_logic_vector (31 downto 0)
    );
end half_adder;

architecture habhv of half_adder is

begin
    s <= a xor b;
    c <= a and b;
end habhv;
