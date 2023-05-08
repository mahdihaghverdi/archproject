library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux4x1 is
    port (
        i0: in signed (31 downto 0);
        i1: in signed (31 downto 0);
        i2: in signed (31 downto 0);
        i3: in signed (31 downto 0);
        s: in std_logic_vector (1 downto 0);
        output: out signed (31 downto 0)
    );
end mux4x1;

architecture muxbhv of mux4x1 is
begin
    with s select output <=
        i0 when "00",
        i1 when "01",
        i2 when "10",
        i3 when others;
end muxbhv;

