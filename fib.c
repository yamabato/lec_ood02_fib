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
  int n;

  printf("Please input numer: ");
  scanf("%d", &n);
  printf("fib(%d) = %lu\n", n, fib(n));

  return 0;
}
