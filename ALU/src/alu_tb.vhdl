library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--  A testbench has no ports.
entity alu_tb is
end alu_tb;

architecture behav of alu_tb is
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

    component alu
        port (
            alu_input_a, alu_input_b: in signed (31 downto 0);  -- 32 bit input
            alu_out: out signed (31 downto 0);     -- 32 bit output
            alu_carryout: out signed (31 downto 0);    -- carry out
            alu_select: in std_logic_vector (1 downto 0)     -- 4 bit select value
        );
    end component;

    --  Specifies which entity is bound with the component.
    for alu_0: alu use entity work.alu;
    signal a, b, o, c : signed (31 downto 0);
    signal s : std_logic_vector (1 downto 0);

begin
    --  Component instantiation.
    alu_0: alu port map (
        alu_input_a => a,
        alu_input_b => b,
        alu_out => o,
        alu_carryout => c,
        alu_select => s
    );
    process
        variable a0 : signed (31 downto 0) := (others => '0');
        variable b0 : signed (31 downto 0) := (0 => '1', others => '0');
        variable s0 : std_logic_vector (1 downto 0) := (others => '0');
        begin
            a <= a0;
            b <= b0;
            s <= s0;

            assert o = b0 report "Hello";
    end process;
end behav;
