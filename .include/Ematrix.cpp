#include <iostream>
#include <vector>

/*
 * 行列演算クラス
 */
class Ematrix
{
  private:
    int row;
    int col;
    std::vector< std::vector<int> > value;
  public:
    Ematrix();
    Ematrix(int, int);
    Ematrix(const Ematrix&);
    int get_row() const;
    int get_col() const;
};

Ematrix::Ematrix()
  :row(1), col(1),
   value(std::vector< std::vector<int> >(1, std::vector<int>(1,0)))
{
}

Ematrix::Ematrix(int row, int col)
  :row(row),
   col(col),
   value(std::vector< std::vector<int> >(row, std::vector<int>(col,0)))
{
}

Ematrix::Ematrix(const Ematrix& mat)
  :row(mat.get_row()),
   col(mat.get_col())
{
}

int Ematrix::get_row() const {
  return this->row;
}

int Ematrix::get_col() const {
  return this->col;
}

int main() {
  Ematrix m;
  std::cout << m.get_col() << std::endl;
}
