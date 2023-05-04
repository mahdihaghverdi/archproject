--  Hello world program.
use std.textio.all; --  Imports the standard textio package.

--  Defines a design entity, without any ports.
entity helloworld is
end helloworld;

architecture behaviour of helloworld is
begin
    process
        variable l : line;
    begin
        write (l, String'("Hello world!"));
        writeline (output, l);
        wait;
    end process;
end behaviour;
