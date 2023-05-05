library ieee;
use ieee.numeric_std.all;

entity full_adder is
    port (
        a, b, ci : in signed (31 downto 0);
        s, c : out signed (31 downto 0)
    );
end full_adder;


architecture fadbhv of full_adder is
    component half_adder
        port (
            a, b : in signed (31 downto 0);
            s, c : out signed (31 downto 0)
        );
    end component;

    for half_adder_0: half_adder use entity work.half_adder;
    for half_adder_1: half_adder use entity work.half_adder;
    signal asb, aab, asbco: signed (31 downto 0);

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
