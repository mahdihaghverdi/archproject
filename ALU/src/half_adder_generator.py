import sys

from random import randint

def two_tupe_bins() -> tuple[str, str]:
    bin_gen = lambda: '0b' + ''.join(str(randint(0, 1)) for _ in range(32))
    return bin_gen(), bin_gen()


def calc(a: str, b: str) -> tuple[str, str]:
    a = int(a, 2)
    b = int(b, 2)

    s = a ^ b
    c = a & b

    fmt = lambda x: bin(x)[2:]
    return f'{fmt(s):0>32}', f'{fmt(c):0>32}'


s, c = calc(
    '0b00000100001110011000100011110101',
    '0b00000100001110011000100110100110',
    )


assert s == '00000000000000000000000101010011'
assert c == '00000100001110011000100010100100'


numbers = []
for _ in range(int(sys.argv[1])):
    numbers.append(two_tupe_bins())

for idx, nums in enumerate(numbers):
    a, b = nums
    s, c = calc(a, b)
    numbers[idx] = (a, b, s, c)


fmt = lambda x: f'{x[2:]:0>32}'

for item in numbers:
    a, b, s, c= item

    print("(")
    print(f'    "{fmt(a)}",')
    print(f'    "{fmt(b)}",')
    print(f'    "{s}",')
    print(f'    "{c}"', sep='\n')
    print("),")
