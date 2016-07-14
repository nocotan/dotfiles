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
    std::vector< std::vector<long long> > value;
  public:
    // 1行1列の行列
    Ematrix();
    // 単位行列
    Ematrix(int);
    // 行数と列数を指定した行列
    Ematrix(int, int);
    // コピーコンストラクタ
    Ematrix(const Ematrix&);
    // 添字演算子
    inline std::vector<long long> operator [](int) const;
    inline std::vector<long long>& operator [](int);
    // 算術演算子
    const Ematrix operator +(const Ematrix&) const;
    const Ematrix operator -(const Ematrix&) const;
    const Ematrix operator *(const Ematrix&) const;
    const Ematrix operator *(const int&) const;
    // 行数ゲッタ
    int get_row() const;
    // 列数ゲッタ
    int get_col() const;
    // 要素ベクトルゲッタ
    std::vector< std::vector<long long> > get_value() const;
};

Ematrix::Ematrix()
  :row(1), col(1),
   value(std::vector< std::vector<long long> >(1,
         std::vector<long long>(1,0)))
{
}

Ematrix::Ematrix(int row, int col)
  :row(row),
   col(col),
   value(std::vector< std::vector<long long> >(row,
         std::vector<long long>(col,0)))
{
}

Ematrix::Ematrix(int e)
  :row(e),
   col(e),
   value(std::vector< std::vector<long long> >(row,
         std::vector<long long>(col,0)))
{
  int c = 0;
  for (int i=0; i<row; i++) {
    value[i][c] = 1;
    c++;
  }
}

Ematrix::Ematrix(const Ematrix& rhs)
  :row(rhs.get_row()),
   col(rhs.get_col())
{
  value = rhs.get_value();
}

inline std::vector<long long> Ematrix::operator [](int index) const
{
  return this->value[index];
}

inline std::vector<long long>& Ematrix::operator [](int index)
{
  return this->value[index];
}

// 和
// 行列の型が同じでなければならない(row==rhs.get_row(), col==rhs.get_col())
const Ematrix Ematrix::operator +(const Ematrix& rhs) const
{
  try {
    Ematrix tmp(row, col);
    for (int i=0; i<row; i++) {
      for (int j=0; j<col; j++) {
        tmp[i][j] = value[i][j] + rhs[i][j];
      }
    }
    return tmp;
  } catch (...) {}
}

// 差
// 行列の型が同じでなければならない(row==rhs.get_row(), col==rhs.get_col())
const Ematrix Ematrix::operator -(const Ematrix& rhs) const
{
  try {
    Ematrix tmp(row, col);
    for (int i=0; i<row; i++) {
      for (int j=0; j<col; j++) {
        tmp[i][j] = value[i][j] - rhs[i][j];
      }
    }
    return tmp;
  } catch (...) {}
}

// 積
// Aの列数とBの行数が等しくなければならない(col==rhs.get_row())
const Ematrix Ematrix::operator *(const Ematrix& rhs) const {
  try {
    Ematrix tmp(row, rhs.get_col());
    for (int i=0; i<row; i++) {
      for (int j=0; j<rhs.get_col(); j++) {
        for (int k=0; k<col; k++) {
          tmp[i][j] +=  value[i][k] * rhs[k][j];
        }
      }
    }
    return tmp;
  } catch (...) {}
}

// 実数倍
const Ematrix Ematrix::operator *(const int& k) const
{
  try {
    Ematrix tmp(row, col);
    for (int i=0; i<row; i++) {
      for (int j=0; j<col; j++) {
        tmp[i][j] = value[i][j] * k;
      }
    }
    return tmp;
  } catch (...) {}
}

int Ematrix::get_row() const
{
  return this->row;
}

int Ematrix::get_col() const
{
  return this->col;
}

std::vector< std::vector<long long> > Ematrix::get_value() const
{
  return this->value;
}
