library ieee;
use ieee.std_logic_1164.all;

entity mux4x1_con is
    port (
        i0: in std_logic;
        i1: in std_logic;
        i2: in std_logic;
        i3: in std_logic;
        select_input: in std_logic_vector(1 downto 0);
        output: out std_logic
    );
end mux4x1_con;

architecture muxbhv of mux4x1_con is
begin
    output <=
        i0 when select_input = "00" else
        i1 when select_input = "01" else
        i2 when select_input = "10" else
        i3;
end muxbhv;
