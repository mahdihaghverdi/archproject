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
    component mux4x1
    port (
        i0: in std_logic_vector (31 downto 0);
        i1: in std_logic_vector (31 downto 0);
        i2: in std_logic_vector (31 downto 0);
        i3: in std_logic_vector (31 downto 0);
        s: in std_logic_vector(1 downto 0);
        output: out std_logic_vector (31 downto 0)
    );
    end component;

begin
end alubhv;

