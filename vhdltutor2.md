# Architecture

```
architecture something of something-else is:
...  -> declaration
begin
    ...
    process
    ...
    begin
        ... -> sequential
    end process;
    ...  -> concurrent
end architecture;
```

# Concurernt
A <= B and C;  -> `signal assigment`

#### signal:
a port or register of the created thing

#### event:
a change on a signal
