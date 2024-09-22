#include <time.h>
#include <stdio.h>
#include <stdint.h>

// n ~ 93
uint64_t fib_rec(int n) {
  if (n == 0) { return 0; }
  else if (n == 1) { return 1; }
  return fib_rec(n-1) + fib_rec(n-2);
}

int main() {
  clock_t start_t;
  int n_list[16] = { 0, 1, 2, 3, 4, 5, 10, 20, 30, 40, 50, 60, 70, 80, 90, 93 };
  int n;

  for (int i=0; i<16; i++) {
    n = n_list[i];
    start_t = clock();
    for (int j=0; j<100000; j++) {
      fib_rec(n);
    }
    printf("%d: %ld\n", n, clock() - start_t);
  }

  return 0;
}
