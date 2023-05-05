import sys

from random import randint

def three_tuple_bins() -> tuple[str, str, str]:
    bin_gen = lambda: '0b' + ''.join(str(randint(0, 1)) for _ in range(32))
    return bin_gen(), bin_gen(), bin_gen()


def calc(a: str, b: str, ci: str) -> tuple[str, str]:
    a = int(a, 2)
    b = int(b, 2)
    ci = int(ci, 2)

    asb = a ^ b
    aab = a & b

    s = asb ^ ci
    asbco = asb & ci

    c = asbco | aab

    fmt = lambda x: bin(x)[2:]

    return f'{fmt(s):0>32}', f'{fmt(c):0>32}'


s, c = calc(
    '0b00000100001110011000100011110101',
    '0b00000100001110011000100110100110',
    '0b00000000000000000000000000000000',
    )


assert s == '00000000000000000000000101010011'
assert c == '00000100001110011000100010100100'


numbers = []
for _ in range(int(sys.argv[1])):
    numbers.append(three_tuple_bins())

for idx, nums in enumerate(numbers):
    a, b, ci = nums
    s, c = calc(a, b, ci)
    numbers[idx] = (a, b, ci, s, c)


fmt = lambda x: f'{x[2:]:0>32}'

print(calc("0b1", "0b1", "0b0"))

for item in numbers:
    a, b, ci, s, c= item

    print("(")
    print(f'    "{fmt(a)}",')
    print(f'    "{fmt(b)}",')
    print(f'    "{fmt(ci)}",')
    print(f'    "{s}",')
    print(f'    "{c}"', sep='\n')
    print("),")
