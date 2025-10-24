#include <iostream>

int main()
{
    int x;
    int b = 16;
    std::cin >> x;

    for (int i = 0; i < 10; ++i)
    {
        std::cout << x % b << ' ';
        x = x / b;
    }
    std::cout << '\n';

    int y = 10;
    int z = (y << 1);
    
    return 0;
}
