#include <array>
#include <stdint.h>
#include <iostream>
#include <chrono>
#include <iterator>

bool is_done(std::array<char, kmer_length> &chars)
{
  for (auto c : chars)
  {
    if (c != 'T')
    {
      return false;
    }
  }
  return true;
}

int8_t convert(int8_t value)
{
  switch (value)
  {
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

int main()
{
  typedef std::chrono::high_resolution_clock Clock;
  auto t1 = Clock::now();
  auto chars = std::array<char, kmer_length>();
  chars.fill('A');
  int64_t counter = 1;
  while (!is_done(chars))
  {
    counter += 1;
    // std::cout << std::string(std::begin(chars), std::end(chars)) << std::endl;
    for (int i = 0; i < kmer_length; i++)
    {
      char c = chars[i];
      chars[i] = convert(c);
      if (c != 'T')
      {
        break;
      }
    }
  }
  auto t2 = Clock::now();
  auto delta = ((t2 - t1).count() / 1000) / 1000;
  std::cout << "Nummer of generated k-mers: " << counter << " - took " << delta << "ms" << std::endl;
}