library ieee;
use ieee.std_logic_1164.all;

--  A testbench has no ports.
entity half_adder_tb is
end half_adder_tb;

architecture behav of half_adder_tb is
    --  Declaration of the component that will be instantiated.
    function to_string ( a: std_logic_vector) return string is
    variable b : string (1 to a'length) := (others => NUL);
    variable stri : integer := 1;
    begin
        for i in a'range loop
            b(stri) := std_logic'image(a((i)))(2);
        stri := stri+1;
        end loop;
    return b;
    end function;

    component half_adder
        port (
            a, b : in std_logic_vector (31 downto 0);
            s, c : out std_logic_vector (31 downto 0)
        );
    end component;

    --  Specifies which entity is bound with the component.
    for half_adder_0: half_adder use entity work.half_adder;
        signal a, b, s, c : std_logic_vector (31 downto 0);
    begin
        --  Component instantiation.
        half_adder_0: half_adder port map (a => a, b => b, s => s, c => c);

--  This process does the real job.
process
    type pattern_type is record
        --  The inputs of the half_adder.
        a, b : std_logic_vector (31 downto 0);
        --  The expected outputs of the half_adder.
        s, c : std_logic_vector (31 downto 0);
    end record;

--  The patterns to apply.
    type pattern_array is array (natural range <>) of pattern_type;
    constant patterns : pattern_array :=
        (
            (
                "00000000000000000000000000000000",
                "00000000000000000000000000000000",
                "00000000000000000000000000000000",
                "00000000000000000000000000000000"
            ),
            (
                "00000000000000000000000000000001",
                "00000000000000000000000000000000",
                "00000000000000000000000000000001",
                "00000000000000000000000000000000"
            ),
            (
                "10000000000000000000000000000000",
                "10000000000000000000000000000000",
                "00000000000000000000000000000000",
                "10000000000000000000000000000000"
            )
        );

begin
    --  Check each pattern.
    for i in patterns'range loop
    --  Set the inputs.
    a <= patterns(i).a;
    b <= patterns(i).b;
    --  Wait for the results.
    wait for 1 ns;
        --  Check the outputs.
            assert s = patterns(i).s
                report LF &
                "a : " & to_string(a) & LF &
                "b : " & to_string(b) & LF &
                "s : " & to_string(s) & LF &
                "c : " & to_string(c) & LF &
                "Bad sum value";
            assert c = patterns(i).c
                report LF &
                "a : " & to_string(a) & LF &
                "b : " & to_string(b) & LF &
                "s : " & to_string(s) & LF &
                "c : " & to_string(c) & LF &
                "Bad carry out value";
        end loop;
            assert false report "end of test" severity note;
        wait;
    end process;
end behav;
