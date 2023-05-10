library ieee;
use ieee.std_logic_1164.all;

entity FourBitMultiplier is
    port (
        input_a, input_b : in std_logic_vector (3 downto 0);
        output: out std_logic_vector (7 downto 0)
    );
end FourBitMultiplier;

architecture arch of FourBitMultiplier is
    component FourBitFullAdder
        port (
            input_a, input_b : in std_logic_vector (3 downto 0);
            sum : out std_logic_vector (3 downto 0);
            carry : out std_logic
        );
    end component;

    for four_bit_full_adder_0: FourBitFullAdder use entity work.FourBitFullAdder;
    for four_bit_full_adder_1: FourBitFullAdder use entity work.FourBitFullAdder;
    for four_bit_full_adder_2: FourBitFullAdder use entity work.FourBitFullAdder;

    signal a0b1, a0b2, a0b3 : std_logic;
    signal input_a_0, input_b_0, input_a_1, input_b_1, input_a_2, input_b_2 : std_logic_vector (3 downto 0);
    signal a1b0, a1b1, a1b2, a1b3 : std_logic;
    signal a2b0, a2b1, a2b2, a2b3 : std_logic;
    signal a3b0, a3b1, a3b2, a3b3 : std_logic;
    signal sum0, sum1, sum2 : std_logic_vector (3 downto 0);
    signal carry_0_1, carry_1_2, carry_2_3 : std_logic;

begin
    a0b1 <= input_a(0) and input_b(1);
    a0b2 <= input_a(0) and input_b(2);
    a0b3 <= input_a(0) and input_b(3);
    input_a_0 <= ('0', a0b3, a0b2, a0b1);
    input_b_0 <= (a1b3, a1b2, a1b1, a1b0);

    a1b0 <= input_a(1) and input_b(0);
    a1b1 <= input_a(1) and input_b(1);
    a1b2 <= input_a(1) and input_b(2);
    a1b3 <= input_a(1) and input_b(3);

    four_bit_full_adder_0: FourBitFullAdder port map (
        input_a => input_a_0,
        input_b => input_b_0,
        sum => sum0,
        carry => carry_0_1
    );
    a2b0 <= input_a(2) and input_b(0);
    a2b1 <= input_a(2) and input_b(1);
    a2b2 <= input_a(2) and input_b(2);
    a2b3 <= input_a(2) and input_b(3);

    input_a_1 <= (carry_0_1, sum0(3), sum0(2), sum0(1));
    input_b_1 <= (a2b3, a2b2, a2b1, a2b0);

    four_bit_full_adder_1: FourBitFullAdder port map (
        input_a => input_a_1,
        input_b => input_b_1,
        sum => sum1,
        carry => carry_1_2
    );

    a3b0 <= input_a(3) and input_b(0);
    a3b1 <= input_a(3) and input_b(1);
    a3b2 <= input_a(3) and input_b(2);
    a3b3 <= input_a(3) and input_b(3);

    input_a_2 <= (carry_1_2, sum1(3), sum1(2), sum1(1));
    input_b_2 <= (a3b3, a3b2, a3b1, a3b0);
    four_bit_full_adder_2: FourBitFullAdder port map (
        input_a => input_a_2,
        input_b => input_b_2,
        sum => sum2,
        carry => carry_2_3
    );
    output <= (
        carry_2_3,
        sum2(3), sum2(2), sum2(1), sum2(0),
        sum1(0),
        sum0(0),
        input_a(0) and input_b(0)
    );
end arch;
