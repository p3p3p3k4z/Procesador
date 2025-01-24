# aun en pruebas
def get_binary_for_number(n):
    base_binary = int("111110111101", 2)  # Starting binary: 111110111101 (34 in decimal)
    # Calculate the binary for the given number
    if n < 34:
        return f"Number {n} is outside the range of this pattern (starts at 34)."
    binary_value = base_binary - 2 * (n - 34)
    return f"{n} -> {bin(binary_value)[2:]}"

# remplaza por el numero deseado
get_binary_for_number(44)
