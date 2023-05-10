library ieee;
use ieee.std_logic_1164.all;

entity mux4x1_tb is
end mux4x1_tb;

architecture arch of mux4x1_tb is
    signal i0, i1, i2, i3, output : std_logic_vector (3 downto 0);
    signal sel : std_logic_vector (1 downto 0);
begin
    UUT : entity work.mux4x1 port map (
        i0 => i0,
        i1 => i1,
        i2 => i2,
        i3 => i3,
        sel => sel,
        output => output
    );


    -- i333 i222 i111 i000 sel   oooo
    -- 1010 0011 0101 0010 00    0010
    -- 1010 0011 0101 0010 01    0101
    -- 1010 0011 0101 0010 10    0011
    -- 1010 0011 0101 0010 11    1010

    i0 <= "0000", "0010" after 20 ns, "0010" after 40 ns, "0010" after 60 ns, "0010" after 80 ns;
    i1 <= "0000", "0101" after 20 ns, "0101" after 40 ns, "0101" after 60 ns, "0101" after 80 ns;
    i2 <= "0000", "0011" after 20 ns, "0011" after 40 ns, "0011" after 60 ns, "0011" after 80 ns;
    i3 <= "0000", "1010" after 20 ns, "1010" after 40 ns, "1010" after 60 ns, "1010" after 80 ns;
    sel <=  "00", "00" after 20 ns, "01" after 40 ns, "10" after 60 ns, "11" after 80 ns, "11" after 100 ns;

end arch;
