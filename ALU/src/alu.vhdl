library ieee;
use ieee.std_logic_1164.all;

entity alu is
    port (
        alu_input_a, alu_input_b: in std_logic_vector (3 downto 0);
        alu_out                 : out std_logic_vector (7 downto 0);
        alu_carry_borrow_out    : out std_logic;
        alu_select              : in std_logic_vector (1 downto 0)
    );
end alu;

architecture arch of alu is
    -- we need a mux, four_bit_full_adder/subber/multiplier
    -- 00 -> full_adder
    -- 01 -> full_subber
    -- 10 -> full_multiplier
    -- 11 -> all one :)

    component mux4x1
        port (
            i0, i1, i2, i3: in std_logic_vector (3 downto 0);
            sel           : in std_logic_vector (1 downto 0);
            output        : out std_logic_vector (3 downto 0)
        );
    end component;

    component FourBitFullAdder
        port (
            input_a, input_b: in std_logic_vector (3 downto 0);
            sum             : out std_logic_vector (3 downto 0);
            carry           : out std_logic
        );
    end component;

    component FourBitFullSubber
        port (
            input_a, input_b: in std_logic_vector (3 downto 0);
            diff            : out std_logic_vector (3 downto 0);
            borrow          : out std_logic
        );
    end component;

    component FourBitMultiplier
        port (
            input_a, input_b: in std_logic_vector (3 downto 0);
            output          : out std_logic_vector (7 downto 0)
        );
    end component;

    signal full_adder_to_i0_t, full_subber_to_i1_t : std_logic_vector(3 downto 0);
    signal before_alu_out : std_logic_vector(3 downto 0);
    signal multiplier_to_i2, full_adder_to_i0, full_subber_to_i1 : std_logic_vector (7 downto 0);
    signal after_alu_out : std_logic_vector (7 downto 0);
begin


    inner_full_adder  : entity work.FourBitFullAdder port map (
        input_a => alu_input_a,
        input_b => alu_input_b,
        sum => full_adder_to_i0_t,
        carry => alu_carry_borrow_out
    );
    full_adder_to_i0 <= "0000" & full_adder_to_i0_t;

    inner_full_subber : entity work.FourBitFullSubber port map (
        input_a => alu_input_a,
        input_b => alu_input_b,
        diff => full_subber_to_i1_t,
        borrow => alu_carry_borrow_out
    );
    full_subber_to_i1 <= "0000" & full_subber_to_i1_t;

    inner_multiplier  : entity work.FourBitMultiplier port map (
        input_a => alu_input_a,
        input_b => alu_input_b,
        output => multiplier_to_i2
    );

    inner_mux : entity work.mux4x1 port map (
        i0 => full_adder_to_i0,
        i1 => full_subber_to_i1,
        i2 => multiplier_to_i2,
        i3 => "11111111",
        sel => alu_select,
        output => alu_out
    );
end arch;
