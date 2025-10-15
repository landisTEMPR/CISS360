#include <iostream>

int main()
{
    int x;
    int b = 8;
    std::cin >> x;

    for (int i = 0; i < 10; ++i)
    {
        std::cout << x % b << ' ';
        x = x / b;
    }
    std::cout << '\n';
    
    return 0;
}
