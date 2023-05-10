library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
    port (
        alu_input_a, alu_input_b: in signed (31 downto 0);  -- 32 bit input
        alu_out: out signed (31 downto 0);                  -- 32 bit output
        alu_carryout: out signed (31 downto 0);             -- carry out
        alu_select: in std_logic_vector (1 downto 0)        -- 2 bit select value
    );
end alu;

architecture alubhv of alu is
    component mux4x1
        port (
            i0: in signed (31 downto 0);
            i1: in signed (31 downto 0);
            i2: in signed (31 downto 0);
            i3: in signed (31 downto 0);
            s: in std_logic_vector(1 downto 0);
            output: out signed (31 downto 0)
        );
    end component;
    for mux4x1_0 : mux4x1 use entity work.mux4x1;

    component full_adder
        port (
            a, b, ci : in signed (31 downto 0);
            s, c : out signed (31 downto 0)
        );
    end component;
    for full_adder_0: full_adder use entity work.full_adder;
    signal a, b, ci, s_from_fa, c_from_fa : signed (31 downto 0);

begin
    -- instantiation
    mux4x1_0: mux4x1 port map(
        i0 => s_from_fa,
        i1 => "00000000000000000000000000000000",
        i2 => "00000000000000000000000000000000",
        i3 => "00000000000000000000000000000000",
        s => alu_select,
        output => alu_out
    );
    full_adder_0: full_adder port map (
        a => alu_input_a,
        b => alu_input_b,
        ci => "00000000000000000000000000000000",
        s => s_from_fa,
        c => c_from_fa
    );
end alubhv;
