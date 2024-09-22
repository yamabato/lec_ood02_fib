#include <time.h>
#include <stdio.h>
#include <stdint.h>
#include <string.h>

#define MEMO_SIZE 94

uint64_t fib_rec_memo(int n, uint64_t *memo) {
  uint64_t val;
  if (memo[n] != -1) { return memo[n]; }

  if (n == 0) { val = 0; }
  else if (n == 1) { val = 1; }
  else { val = fib_rec_memo(n-1, memo) + fib_rec_memo(n-2, memo); }
  memo[n] = val;
  return val;
}

int main() {
  clock_t start_t;
  int n_list[16] = { 0, 1, 2, 3, 4, 5, 10, 20, 30, 40, 50, 60, 70, 80, 90, 93 };
  int n;

  uint64_t memo[MEMO_SIZE];

  for (int i=0; i<16; i++) {
    n = n_list[i];
    start_t = clock();
    for (int j=0; j<100000; j++) {
      memset(memo, -1, sizeof(memo));
      fib_rec_memo(n, memo);
    }
    printf("%d: %ld\n", n, clock() - start_t);
  }

  return 0;
}
