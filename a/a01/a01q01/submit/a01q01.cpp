// File: a01q01.cpp
// Author: Brysen Landis

#include <iostream>

int main()
{
    int a = 0, b = 0, c = 0, d = 0, e = 0, f = 0, g = 1;
    std::cin >> a >> b >> c >> d >> e >> f >> g;
// Declare your temporary variables below.
// For instance if you need three temporary variables below you
// should have "int t0, t1, t2;" below this line.
// REPLACE WITH YOUR WORK for
// a = a + b - c * d + e * f / g;
    
    int t0;            

    a = a + b;         
    t0 = c * d;        
    a = a - t0;        
    t0 = e * f;        
    t0 = t0 / g;       
    a = a + t0;        
    
// Number of temporary variables: 1
    
    std::cout << a << ' ' << b << ' ' << c << ' '
              << d << ' ' << e << ' ' << f << ' '
              << g << std::endl;
    return 0;
}
