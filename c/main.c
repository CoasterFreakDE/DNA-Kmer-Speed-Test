#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Thankfully stolen:
// https://gist.github.com/nickolayl/f6651e978db145141faa1d986182014f
#if defined(__linux)
#define HAVE_POSIX_TIMER
#include <time.h>
#ifdef CLOCK_MONOTONIC
#define CLOCKID CLOCK_MONOTONIC
#else
#define CLOCKID CLOCK_REALTIME
#endif
#elif defined(__APPLE__)
#define HAVE_MACH_TIMER
#include <mach/mach_time.h>
#elif defined(_WIN32)
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#endif
static uint64_t ns(void) {
  static uint64_t is_init = 0;
#if defined(__APPLE__)
  static mach_timebase_info_data_t info;
  if (0 == is_init) {
    mach_timebase_info(&info);
    is_init = 1;
  }
  uint64_t now;
  now = mach_absolute_time();
  now *= info.numer;
  now /= info.denom;
  return now;
#elif defined(__linux)
  static struct timespec linux_rate;
  if (0 == is_init) {
    clock_getres(CLOCKID, &linux_rate);
    is_init = 1;
  }
  uint64_t now;
  struct timespec spec;
  clock_gettime(CLOCKID, &spec);
  now = spec.tv_sec * 1.0e9 + spec.tv_nsec;
  return now;
#elif defined(_WIN32)
  static LARGE_INTEGER win_frequency;
  if (0 == is_init) {
    QueryPerformanceFrequency(&win_frequency);
    is_init = 1;
  }
  LARGE_INTEGER now;
  QueryPerformanceCounter(&now);
  return (uint64_t)((((int64_t)1e9) * now.QuadPart) / win_frequency.QuadPart);
#endif
}

bool is_done(char *s) {
  for (int i = 0; i < kmer_length; i++) {
    if (s[i] != 'T')
      return false;
  }
  return true;
}

int8_t convert(int8_t value) {
  switch (value) {
  case 'A':
    return 'C';
  case 'C':
    return 'G';
  case 'G':
    return 'T';
  case 'T':
    return 'A';
  }
  return ' ';
}

int main(void) {
  uint64_t start = ns();
  char *s = calloc(1, (kmer_length + 1) * sizeof(int8_t));
  memset(s, 'A', kmer_length);
  int64_t counter = 1;
  while (!is_done(s)) {
    counter += 1;
    // printf("%s\n", s);
    for (int i = 0; i < kmer_length; i++) {
      char c = s[i];
      s[i] = convert(c);
      if (c != 'T') {
        break;
      }
    }
  }
  uint64_t delta = ((ns() - start) / 1000) / 1000;
  printf("Number of generated k-mers: %lld - took %lldms\n", counter, delta);
}
