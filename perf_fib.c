#include <time.h>
#include <stdio.h>
#include <stdint.h>

uint64_t fib(int n) {
  uint64_t f = 0;
  uint64_t x = 1;
  uint64_t y = 0;

  for (int i=0; i<n; i++) {
    f += x;
    x = y;
    y = f;
  }

  return f;
}

int main() {
  clock_t start_t;
  int n_list[16] = { 0, 1, 2, 3, 4, 5, 10, 20, 30, 40, 50, 60, 70, 80, 90, 93 };
  int n;

  for (int i=0; i<16; i++) {
    n = n_list[i];
    start_t = clock();
    for (int j=0; j<100000; j++) {
      fib(n);
    }
    printf("%d: %ld\n", n, clock() - start_t);
  }

  return 0;
}
