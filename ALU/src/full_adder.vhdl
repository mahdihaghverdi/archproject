library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    port (
        a, b, ci : in std_logic_vector (31 downto 0);
        s, c : out std_logic_vector (31 downto 0)
    );
end full_adder;


architecture fadbhv of full_adder is
    component half_adder
        port (
            a, b : in std_logic_vector (31 downto 0);
            s, c : out std_logic_vector (31 downto 0)
        );
    end component;

    for half_adder_0: half_adder use entity work.half_adder;
    for half_adder_1: half_adder use entity work.half_adder;
    signal asb, aab, asbco: std_logic_vector (31 downto 0);

    -- Instantiation
begin
    half_adder_0: half_adder port map(
        -- entity-signal-name => local-signal-name
        a => a,
        b => b,
        s => asb,
        c => aab
    );
    half_adder_1: half_adder port map(
        a => asb,
        b => ci,
        s => s,
        c => asbco
    );

    c <= aab or asbco;
end fadbhv;
