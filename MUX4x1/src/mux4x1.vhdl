library ieee;
use ieee.std_logic_1164.all;

entity mux4x1 is
    port (
        i0: in std_logic;
        i1: in std_logic;
        i2: in std_logic;
        i3: in std_logic;
        select_input: in std_logic_vector(1 downto 0);
        output: out std_logic
    );
end mux4x1;

architecture muxbhv of mux4x1 is
begin
    with select_input select output <=
        i0 when "00",
        i1 when "01",
        i2 when "10",
        i3 when others;
end muxbhv;
