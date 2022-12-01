echo $(cat results/$1_$2/kmer_$1_$2.rawresult.txt | ./sd "(.*)\nNumber of generated k-mers: (.*) took " "")
