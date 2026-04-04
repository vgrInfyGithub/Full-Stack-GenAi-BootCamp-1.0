"""
math_operations.py
A simple Python script that demonstrates basic arithmetic and math module functions.
"""

import math
import sys


def main():
    if len(sys.argv) != 3:
        print("Usage: python math_operations.py <a> <b>")
        print("Example: python math_operations.py 10 3")
        sys.exit(1)

    try:
        a = float(sys.argv[1])
        b = float(sys.argv[2])
    except ValueError:
        print("Error: both arguments must be numbers")
        sys.exit(1)

    print("--- Basic operators (from CLI) ---")
    print(f"{a} + {b} =", a + b)
    print(f"{a} - {b} =", a - b)
    print(f"{a} * {b} =", a * b)
    print(f"{a} / {b} =", a / b if b != 0 else 'inf')
    print(f"{a} // {b} =", a // b if b != 0 else 'inf')
    print(f"{a} % {b} =", a % b if b != 0 else 'nan')
    print(f"{a} ** {b} =", a ** b)

    print("\n--- math module operations (sample) ---")
    print("math.ceil(a) =", math.ceil(a))
    print("math.floor(b) =", math.floor(b))
    print("math.sqrt(a*a) =", math.sqrt(a * a))
    print("math.log(abs(a)+1, 10) =", math.log(abs(a) + 1, 10))


if __name__ == "__main__":
    main()
