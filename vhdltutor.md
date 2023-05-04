# VHDL Code Structure

```
-----------------------
| Packages            |
-----------------------
| Entity or Interface |  -> to connect we use ports and generics
-----------------------
| Achitecture 1       |  -> the main codes of the design (concurrent statements, sequential statements, component instantiation)
-----------------------
| Achitecture 2       |
-----------------------
| Achitecture 3       |
-----------------------
| Achitecture (n)     |
-----------------------
```


# VHDL Operators

## Boolean ops:
- NOT
- AND
- OR
- NAND
- NOR
- XOR
- XNOR

## Comparison
- =
- /=
- <
- \>
- <=
- \>=

## Arithmatics
- \+
- \-
- \*
- /
- MOD
- REM
- ABS
- **

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.SID_LOGIC_UNSIGNED.ALL; -- or SIGNED
```


# Defining Entity
```vhdl
entity entity_name is port (
    port-name-a: mode type;
    ....
    port-name-n: mode type
)
end [entity][entity_name];
```

## Port
- Each I/O signal in the entity is referred
- like the pins in schema
- is the data object
- can be assigned values
- can be used in expressions

### Modes
- `in`: data flows into entity
- `out`: data gets outta entity
- `inout`: bidirectional port
- `buffer`: used for internal feedback


## Data types
- scalar `->` stores a single value
  - `bit`
  - `boolean`
  - `integer`
  - `character`
  - `std_ulogic`
  - `std_logic`
- composite `->` stores multiple values
  - `bit_vector`
  - `string`
  - `std_ulogic_vector`
  - `std_logic_vector`

### `std_logic` values
- `0`: Force 0
- `1`: Force 1
- `Z`: High Impedance
- `X`: Strong Unknown
- `U`: Uninitialized
- `L`: Weak Unknown
- `H`: Weak 1
- `-`: don't care

### `array`
- TYPE row IS ARRAY(4 DOWNTO 0) OF std_logic; -- 1D array
- TYPE matrix IS ARRAY(0 TO 2) OF row; -- 2D array
- TYPE matrix IS ARRAY(0 TO 2) OF std_logic_vector(4 DOWNTO 0);

### `record`
- group objects together

```vhdl
TYPE birthday IS RECORD
  day: INTEGER RANGE 1 to 31;
  month: month_name;
END RECORD
```

```vhdl
TYPE state IS (idle, forward, backward, stop)
```

This is a simulation of a wire
```vhdl
SIGNAL x: SINGED (7 DOWNTO 0);
```

```vhdl
library IEEE;
use IEEE.std_logic_arith.ALL;
```

### Conversion
```vhdl
type long is integer range -100 to 100;
type short is integer range -10 to 10;
signal x: short;
signal y: long;
y <= 2*x + 3
y <= long(2*x + 3);
```

# Architecture declaration
**Establi**