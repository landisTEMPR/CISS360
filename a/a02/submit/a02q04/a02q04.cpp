// File : a02q04.cpp
// Author : Brysen Landis
#include <iostream>


int main()
{
    int a, b, c, d;
    
    std::cin >> a >> b >> c >> d;
    
    a = 2 * a - c - d;
    
    std::cout << a << std::endl;
    std::cout << b << std::endl;
    std::cout << c << std::endl;
    std::cout << d << std::endl;
    
    return 0;
}
