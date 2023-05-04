library ieee;
use ieee.std_logic_1164.all;

entity alu is
    port (
        a, b: in std_logic_vector (31 downto 0);  -- 32 bit input
        s: in std_logic_vector (3 downto 0);      -- 4 bit select value
        o: out std_logic_vector (31 downto 0)     -- 32 bit output
    );
end alu;

architecture alubhv of alu is
begin

end alubhv;

