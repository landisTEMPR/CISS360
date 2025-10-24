#include <iostream>

void get_bits(int b[32], int x, int base = 2)
{
    for (int i = 0; i < 32; ++i)
    {
        b[i] = x % base;
        x /= base;
    }
}

void println_bits(int x, int base = 2)
{
    char S[36];
    for (int i = 0; i < 10; ++i) S[i] = '0' + i;
    for (int i = 0; i < 26; ++i) S[10 + i] = 'A' + i;

    int b[32];
    get_bits(b, x, base);
    for (int i = 31; i >= 0; --i)
    {
        std::cout << S[b[i]] << ' ';
    }
    std::cout << '\n';
}

int main()
{
    int x, base = 2;
    std::cin >> x >> base;
    println_bits(x, base);

    int y = (x << 1);
    int z = x * 2;
    std::cout << x << ": "; println_bits(x, base);
    std::cout << y << ": "; println_bits(y, base);
    std::cout << z << ": "; println_bits(z, base);
    return 0;
}
