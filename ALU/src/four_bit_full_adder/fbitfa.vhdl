library ieee;
use ieee.std_logic_1164.all;

entity FourBitFullAdder is
    port (
        input_a, input_b : in std_logic_vector (3 downto 0);
        sum : out std_logic_vector (3 downto 0);
        carry : out std_logic
    );
end FourBitFullAdder;

architecture arch of FourBitFullAdder is
    component full_adder
        port (
            a, b, ci : in std_logic;
            s, c : out std_logic
        );
    end component;

    for full_adder_0: full_adder use entity work.full_adder;
    for full_adder_1: full_adder use entity work.full_adder;
    for full_adder_2: full_adder use entity work.full_adder;
    for full_adder_3: full_adder use entity work.full_adder;

    signal carry_0_1, carry_1_2, carry_2_3 : std_logic;
begin
    full_adder_0: full_adder port map (
        a => input_a(0),
        b => input_b(0),
        ci => '0',
        s => sum(0),
        c => carry_0_1
    );
    full_adder_1: full_adder port map (
        a => input_a(1),
        b => input_b(1),
        ci => carry_0_1,
        s => sum(1),
        c => carry_1_2
    );
    full_adder_2: full_adder port map (
        a => input_a(2),
        b => input_b(2),
        ci => carry_1_2,
        s => sum(2),
        c => carry_2_3
    );
    full_adder_3: full_adder port map (
        a => input_a(3),
        b => input_b(3),
        ci => carry_2_3,
        s => sum(3),
        c => carry
    );

end arch;
