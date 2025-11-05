#ifndef INTARRAY_H
#define INTARRAY_H

class IntArray
{
  public:
    IntArray(); // by default the array has no values
                // i.e., set size_ to 0
                // All values of the member variables are
                // automatic. Dont need a deconstructor.
    int operator[](int) const;
    int & operator[](int);
    void resize(int);
    void push_back(int);
    int size() const;
  private:
    int a_[5];
    int size_;
    int capacity_;
};

std::ostream & operator<<(std::ostream &, const IntArray &);

#endif
