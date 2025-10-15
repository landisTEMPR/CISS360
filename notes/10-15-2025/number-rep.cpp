#include <iostream>

int main()
{
    int x;
    int b = 3;
    std::cin >> x;

    for (int i = 0; i < 10; ++i)
    {
        std::cout << x % b << ' ';
        x = x / b;
    }
    
    return 0;
}
