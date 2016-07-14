//#define _GRIBCXX_DEBUG
#include <algorithm>
#include <cctype>
#include <climits>
#include <cmath>
#include <complex>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <ctime>
#include <deque>
#include <functional>
#include <iostream>
#include <list>
#include <map>
#include <memory>
#include <numeric>
#include <queue>
#include <string>
#include <utility>
#include <vector>
using namespace std;


// 基本テンプレート
#define rep(i,n) for(int i=0; i<(int)n; ++i)
#define REP(i,x,n) for(int i=x; i<(int)n; ++i)
#define repi(i,n) for(int i=0; i<=(int)n; ++i)
#define REPI(i,x,n) for(int i=x; i<=(int)n; ++i)
#define FOR(i,c) for(__typeof((c).begin())!=(c).begin(); i!=(c).end(); ++i)
#define ALL(c) (c).begin(), (c).end()

typedef long long ll;
typedef pair<int, int> pii;
typedef vector<double> vd;
typedef vector<int> vi;
typedef vector<long long> vl;
typedef vector<long, long> pil;


// Effective std
template<typename C, typename T>
constexpr int count(C& c, T t) { return count(ALL(c), t); }

template<typename C, typename F>
constexpr int count_if(C& c, F f) { return count_if(ALL(c), f); }

template<typename C, typename T, typename U>
constexpr void replace(C& c, T t, U u) { replace(ALL(c), t, u); }

template<typename C, typename F, typename U>
constexpr void replace_if(C& c, F f, U u) { (ALL(c), f, u); }

template<typename C>
constexpr void sort(C& c) { sort(ALL(c)); }

template<typename C, typename Pred>
constexpr void sort(C& c, Pred p) { sort(ALL(c), p); }


// グラフテンプレート
typedef int Weight;

struct Edge {
  int src, dst;
  Weight weight;
  Edge(int src, int dst, Weight weight) :
    src(src), dst(dst), weight(weight) {}
};

bool operator < (const Edge &e, const Edge &f) {
  return e.weight != f.weight ? e.weight > f.weight :
    e.src != f.src ? e.src < f.src : e.dst < f.dst;
}

typedef vector<Edge> Edges;
typedef vector<Edges> Graph;
typedef vector<Weight> Array;
typedef vector<Array> Matrix;

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


int main() {
  return 0;
}
