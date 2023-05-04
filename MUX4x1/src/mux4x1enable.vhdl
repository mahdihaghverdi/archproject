library ieee;
use ieee.std_logic_1164.all;

entity mux4x1_en is
    port (
        i0          : in    std_logic;
        i1          : in    std_logic;
        i2          : in    std_logic;
        i3          : in    std_logic;
        select_input: in    std_logic_vector(1 downto 0);
        enable      : in    std_logic;
        output      : out   std_logic
    );
end mux4x1_en;

architecture muxbhv of mux4x1_en is
    signal permission: std_logic_vector(2 downto 0)  := "000";
begin

    permission <= enable & select_input;  -- concatenation operator

    with permission select output <=
        i0 when "100",
        i1 when "101",
        i2 when "110",
        i3 when "111",
        '0' when others;
end muxbhv;
