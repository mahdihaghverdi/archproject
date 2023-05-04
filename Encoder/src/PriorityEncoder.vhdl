library ieee;
use ieee.std_logic_1164.all;

entity PriorityEncoder is
    port (
        w : in std_logic_vector (3 downto 0);
        o : out std_logic_vector (1 downto 0)
    );
end PriorityEncoder;

architecture pe of PriorityEncoder is
begin
    o <= "11" when w(3) = '1' else
         "10" when w(2) = '1' else
         "01" when w(1) = '1' else
         "00";
end pe;

