#include <iostream>
#include "IntArray.h"

IntArray::IntArray()
    : size_(0), capacity_(5)
{}


int IntArray::operator[](int i) const
{
    return a_[i];
}


int & IntArray::operator[](int i)
{
    return a_[i];
}


void IntArray::resize(int size)
{
    size_ = size;
}


void IntArray::push_back(int v)
{
    if (size_ < capacity_)
    {
        a_[size_++] = v;
    }
    // proper way if there is an error is to throw an exception
}

int IntArray::size() const
{
    return size_;
}
std::ostream & operator<<(std::ostream & cout, const IntArray & a)
{
    cout << '{';
    for (int i = 0; i < a.size(); ++i)
    {
        cout << a[i];
        if (i < a.size() - 1)
        {
            cout << ", ";
        }
    }
    cout << '}';
    return cout;
}

