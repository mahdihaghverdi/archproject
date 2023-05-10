library ieee;
use ieee.std_logic_1164.all;

entity FourBitFullSubber is
    port (
        input_a, input_b : in std_logic_vector (3 downto 0);
        diff : out std_logic_vector (3 downto 0);
        borrow : out std_logic
    );
end FourBitFullSubber;

architecture arch of FourBitFullSubber is
    component full_subber
        port(
            a , b, borrow_in: in std_logic;
            diff, borrow_out : out std_logic
        );
    end component;

    for full_subber_0: full_subber use entity work.full_subber;
    for full_subber_1: full_subber use entity work.full_subber;
    for full_subber_2: full_subber use entity work.full_subber;
    for full_subber_3: full_subber use entity work.full_subber;

    signal borrow_0_1, borrow_1_2, borrow_2_3 : std_logic;
begin
    full_subber_0: full_subber port map (
        a => input_a(0),
        b => input_b(0),
        borrow_in => '0',
        diff => diff(0),
        borrow_out => borrow_0_1
    );
    full_subber_1: full_subber port map (
        a => input_a(1),
        b => input_b(1),
        borrow_in => borrow_0_1,
        diff => diff(1),
        borrow_out => borrow_1_2
    );
    full_subber_2: full_subber port map (
        a => input_a(2),
        b => input_b(2),
        borrow_in => borrow_1_2,
        diff => diff(2),
        borrow_out => borrow_2_3
    );
    full_subber_3: full_subber port map (
        a => input_a(3),
        b => input_b(3),
        borrow_in => borrow_2_3,
        diff => diff(3),
        borrow_out => borrow
    );
end arch;
