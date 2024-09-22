#include <time.h>
#include <stdio.h>
#include <stdint.h>

uint64_t fib_rec_tail(int n, uint64_t f0, uint64_t f1) {
  if (n == 0) { return f0; }
  if (n == 1) { return f1; }
  return fib_rec_tail(n-1, f1, f0+f1);
}

int main() {
  clock_t start_t;
  int n_list[16] = { 0, 1, 2, 3, 4, 5, 10, 20, 30, 40, 50, 60, 70, 80, 90, 93 };
  int n;

  for (int i=0; i<16; i++) {
    n = n_list[i];
    start_t = clock();
    for (int j=0; j<100000; j++) {
      fib_rec_tail(n, 0, 1);
    }
    printf("%d: %ld\n", n, clock() - start_t);
  }

  return 0;
}
