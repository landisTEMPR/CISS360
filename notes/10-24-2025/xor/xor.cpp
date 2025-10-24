#include <iostream>

int AND(int x, int y)
{
    if (x == 0 && y == 0)
    {
        return 0;
    }
    else if (x == 0 && y == 1)
    {
        return 0;
    }
    else if (x == 1 && y == 0)
    {
        return 0;
    }
    else // x == 1 && y == 1
    {
        return 1;
    }
}

int OR(int x, int y)
{
    if (x == 0 && y == 0)
    {
        return 0;
    }
    else if (x == 0 && y == 1)
    {
        return 1;
    }
    else if (x == 1 && y == 0)
    {
        return 1;
    }
    else // x == 1 && y == 1
    {
        return 1;
    }
}

int NOT(int x)
{
    if (x == 0)
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

// XOR built using other gates
int XOR(int x, int y)
{
    // (x OR y) AND NOT(x AND y)
    int orResult = OR(x, y);
    int andResult = AND(x, y);
    int notAnd = NOT(andResult);

    return AND(orResult, notAnd);
}

int main()
{
    std::cout << "XOR built from other gates:\n";

    std::cout << "XOR(0, 0): " << XOR(0, 0) << std::endl;
    std::cout << "XOR(0, 1): " << XOR(0, 1) << std::endl;
    std::cout << "XOR(1, 0): " << XOR(1, 0) << std::endl;
    std::cout << "XOR(1, 1): " << XOR(1, 1) << std::endl;

    return 0;
}
