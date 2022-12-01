echo $(cat results/kmer_$1_$2.rawresult.txt | sed -e '/.* - took .*/!d' | sed -r 's/Number of generated k-mers: .* - took (.*)/\1/g')
