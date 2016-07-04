#ifndef ESTD_HPP
#define ESTD_HPP

#include <algorithm>

namespace Estd {
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
