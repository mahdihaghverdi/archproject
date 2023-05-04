library ieee;
use ieee.std_logic_1164.all;

entity mux4x1_tb is
end mux4x1_tb;

architecture behav of mux4x1_tb is

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

    --  Specifies which entity is bound with the component.
    for mux4x1_0: mux4x1 use entity work.mux4x1;
        signal i0, i1, i2, i3, output : std_logic_vector (31 downto 0);
        signal s : std_logic_vector (1 downto 0);
    begin
        mux4x1_0: mux4x1 port map (
            i0 => i0,
            i1 => i1,
            i2 => i2,
            i3 => i3,
            s => s,
            output => output
            );

--  This process does the real job.
process
    type pattern_type is record
        --  The inputs of the mux4x1.
        i0, i1, i2, i3 : std_logic_vector (31 downto 0);
        s : std_logic_vector (1 downto 0);
        --  The expected outputs of the mux4x1.
        output : std_logic_vector (31 downto 0);
    end record;

--  The patterns to apply.
    type pattern_array is array (natural range <>) of pattern_type;
    constant patterns : pattern_array :=
        (
            ("00000000000000000000000000000000",
            "00000000000000000000000000000001",
            "00000000000000000000000000000010",
            "00000000000000000000000000000011",
            "00",
            "00000000000000000000000000000000"),

            ("00000000000000000000000000000000",
            "00000000000000000000000000000001",
            "00000000000000000000000000000010",
            "00000000000000000000000000000011",
            "01",
            "00000000000000000000000000000001"),

            ("00000000000000000000000000000000",
            "00000000000000000000000000000001",
            "00000000000000000000000000000010",
            "00000000000000000000000000000011",
            "10",
            "00000000000000000000000000000010"),

            ("00000000000000000000000000000000",
            "00000000000000000000000000000001",
            "00000000000000000000000000000010",
            "00000000000000000000000000000011",
            "11",
            "00000000000000000000000000000011")
            );

begin
    --  Check each pattern.
    for i in patterns'range loop
    --  Set the inputs.
    i0 <= patterns(i).i0;
    i1 <= patterns(i).i1;
    i2 <= patterns(i).i2;
    i3 <= patterns(i).i3;

    s <= patterns(i).s;
    output <= patterns(i).output;

    --  Wait for the results.
    wait for 1 ns;
        --  Check the outputs.
        assert output = patterns(i).output report LF & "i0 : " & to_string(i0) & LF & "i1 : " & to_string(i1) & LF & "i2 : " & to_string(i2) & LF & "i3 : " & to_string(i3) & LF & "s : " & to_string(s) & LF & "output : " & to_string(output);
        end loop;
        assert false report "end of test" severity note;
        --  Wait forever; this will finish the simulation.
        wait;
    end process;
end behav;
