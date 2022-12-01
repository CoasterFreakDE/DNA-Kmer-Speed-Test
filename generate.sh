#!/bin/bash
for i in $(seq $1 $2)
do
  make LENGTH=${i} > kmer${i}.txt
  echo "Length ${i}"
  cat kmer${i}.txt | sed -e '/.* - took .*/!d' | sed -r 's/Number of generated k-mers: .* - took (.*)/\1/g'
done