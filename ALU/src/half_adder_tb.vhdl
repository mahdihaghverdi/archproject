library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--  A testbench has no ports.
entity half_adder_tb is
end half_adder_tb;

architecture behav of half_adder_tb is
    --  Declaration of the component that will be instantiated.
    function to_string ( a: signed) return string is
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
            a, b : in signed (31 downto 0);
            s, c : out signed (31 downto 0)
        );
    end component;

    --  Specifies which entity is bound with the component.
    for half_adder_0: half_adder use entity work.half_adder;
    signal a, b, s, c : signed (31 downto 0);

begin
    --  Component instantiation.
    half_adder_0: half_adder port map (a => a, b => b, s => s, c => c);

--  This process does the real job.
process
    type pattern_type is record
        --  The inputs of the half_adder.
        a, b : signed (31 downto 0);
        --  The expected outputs of the half_adder.
        s, c : signed (31 downto 0);
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
                "00000000000000000000000000000011",
                "00000000000000000000000000000010",
                "00000000000000000000000000000001"
            ),
            (
                "00000010000011110001100101100000",
                "00000111110000010100001100100111",
                "00000101110011100101101001000111",
                "00000010000000010000000100100000"
            ),
            (
                "11110100000100011001110010001110",
                "01110111110110101001100110001001",
                "10000011110010110000010100000111",
                "01110100000100001001100010001000"
            ),
            (
                "00110011100010110111011001010000",
                "01110000111000010111111000011111",
                "01000011011010100000100001001111",
                "00110000100000010111011000010000"
            ),
            (
                "00001001101001111100111110101001",
                "11001100001001001011110101100001",
                "11000101100000110111001011001000",
                "00001000001001001000110100100001"
            ),
            (
                "10010011100010010110000100111011",
                "00000110001000100000100110010000",
                "10010101101010110110100010101011",
                "00000010000000000000000100010000"
            ),
            (
                "10011011011000101111100010001101",
                "00100011101110100001000100011010",
                "10111000110110001110100110010111",
                "00000011001000100001000000001000"
            ),
            (
                "10001000100110100010010001000100",
                "00110110010100001001010110001111",
                "10111110110010101011000111001011",
                "00000000000100000000010000000100"
            ),
            (
                "00000111100010101011101010110100",
                "00011011000001111111001000100101",
                "00011100100011010100100010010001",
                "00000011000000101011001000100100"
            ),
            (
                "11100001111110001100011111011010",
                "10001111011000101101000110001001",
                "01101110100110100001011001010011",
                "10000001011000001100000110001000"
            ),
            (
                "11000100100110010110101101101101",
                "10000100110100100011111010111001",
                "01000000010010110101010111010100",
                "10000100100100000010101000101001"
            ),
            (
                "10111111110100101101001000100100",
                "00111100100100011011100111100100",
                "10000011010000110110101111000000",
                "00111100100100001001000000100100"
            ),
            (
                "11111000110010011111000100001010",
                "00011111101110111100110100010000",
                "11100111011100100011110000011010",
                "00011000100010011100000100000000"
            ),
            (
                "11011101100100001000011001010011",
                "00011111010101110001111010011100",
                "11000010110001111001100011001111",
                "00011101000100000000011000010000"
            ),
            (
                "11011111001010010010101001110010",
                "11100100000111001110001010010000",
                "00111011001101011100100011100010",
                "11000100000010000010001000010000"
            ),
            (
                "00010000000100110010010111010110",
                "11001010011011000001010011001111",
                "11011010011111110011000100011001",
                "00000000000000000000010011000110"
            ),
            (
                "11011100111000110001011000100010",
                "00011011111011111010101100011101",
                "11000111000011001011110100111111",
                "00011000111000110000001000000000"
            ),
            (
                "11110111010100001101110010011010",
                "01110100001101110010111111010010",
                "10000011011001111111001101001000",
                "01110100000100000000110010010010"
            ),
            (
                "00011110000000001111000100001000",
                "11101100011101100011101110011010",
                "11110010011101101100101010010010",
                "00001100000000000011000100001000"
            ),
            (
                "10101000111101101100010010010010",
                "10011111000110101111010010011010",
                "00110111111011000011000000001000",
                "10001000000100101100010010010010"
            ),
            (
                "00111011111111001011110101011110",
                "00011001100010111100011011100000",
                "00100010011101110111101110111110",
                "00011001100010001000010001000000"
            ),
            (
                "00001000001011001111000001100110",
                "11001011111011111101000110000000",
                "11000011110000110010000111100110",
                "00001000001011001101000000000000"
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
