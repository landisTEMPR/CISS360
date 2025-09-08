// 09-08-2025
// base 10 to base 2 converter


#include <iostream>


int main()
{
    int x;
    std::cin >> x;
    for (int i = 0; i < 32; ++i)
    {
        std::cout << x % 2 << ' ';
        x /= 2;
    }

    std::cout << '\n';
    return 0;
}
