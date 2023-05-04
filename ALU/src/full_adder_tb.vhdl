library ieee;
use ieee.std_logic_1164.all;

--  A testbench has no ports.
entity full_adder_tb is
end full_adder_tb;

architecture behav of full_adder_tb is
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

    component full_adder
        port (
            a, b, ci : in std_logic_vector (31 downto 0);
            s, c : out std_logic_vector (31 downto 0)
        );
    end component;

    --  Specifies which entity is bound with the component.
    for full_adder_0: full_adder use entity work.full_adder;
    signal a, b, ci, s, c : std_logic_vector (31 downto 0);

begin
    --  Component instantiation.
    full_adder_0: full_adder port map (a => a, b => b, ci => ci, s => s, c => c);

--  This process does the real job.
process
    type pattern_type is record
        --  The inputs of the full_adder.
        a, b, ci : std_logic_vector (31 downto 0);
        --  The expected outputs of the full_adder.
        s, c : std_logic_vector (31 downto 0);
    end record;

--  The patterns to apply.
    type pattern_array is array (natural range <>) of pattern_type;
    constant patterns : pattern_array :=
        (
            (
                "00000100001110011000100011110101",
                "00000100001110011000100110100110",
                "00000000000000000000000000000000",
                "00000000000000000000000101010011",
                "00000100001110011000100010100100"
            ),
            (
                "01000100001110011010100011110101",
                "00111100001010111000000010100110",
                "00110111101111000010101001010010",
                "01001111101011100000001000000001",
                "00110100001110011010100011110110"
            ),
            (
                "11011100110111111011011011110100",
                "11100110111001101110101011011101",
                "10011110001001001010010111101110",
                "10100100000111011111100111000111",
                "11011110111001101010011011111100"
            ),
            (
                "01101000011010011100000011001000",
                "10010101010110100000010010000111",
                "11100011010000100000110000001101",
                "00011110011100011100100001000010",
                "11100001010010100000010010001101"
            )
        );

begin
    --  Check each pattern.
    for i in patterns'range loop
    --  Set the inputs.
    a <= patterns(i).a;
    b <= patterns(i).b;
    ci <= patterns(i).ci;
    --  Wait for the results.
    wait for 1 ns;
        --  Check the outputs.
            assert s = patterns(i).s
                report LF &
                "a : " & to_string(a) & LF &
                "b : " & to_string(b) & LF &
                "ci : " & to_string(ci) & LF &
                "s : " & to_string(s) & LF &
                "c : " & to_string(c) & LF &
                "Bad sum value";
            assert c = patterns(i).c
                report LF &
                "a : " & to_string(a) & LF &
                "b : " & to_string(b) & LF &
                "ci : " & to_string(ci) & LF &
                "s : " & to_string(s) & LF &
                "c : " & to_string(c) & LF &
                "Bad carry out value";
        end loop;
            assert false report "end of test" severity note;
        wait;
    end process;
end behav;
