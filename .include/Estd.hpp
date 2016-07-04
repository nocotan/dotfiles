#ifndef ESTD_HPP
#define ESTD_HPP

#include <algorithm>

namespace Estd {
  template<typename C, typename T>
  int count(C& c, T t) {
    return std::count(c.begin(), c.end(), t);
  }

  template<typename C, typename F>
  int count_if(C& c, F f) {
    return std::count_if(c.begin(), c.end(), f);
  }

  template<typename C, typename T, typename U>
  void replace(C& c, T t, U u) {
    std::replace(c.begin(), c.end(), t, u);
  }

  template<typename C, typename F, typename U>
  void replace_if(C& c, F f, U u) {
    std::replace_if(c.begin(), c.end(), f, u);
  }

  template<typename C>
  void sort(C& c) {
    std::sort(c.begin(), c.end());
  }

  template<typename C, typename Pred>
  void sort(C& c, Pred p) {
    std::sort(c.begin(), c.end(), p);
  }
}

#endif
