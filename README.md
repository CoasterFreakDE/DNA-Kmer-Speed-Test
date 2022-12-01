![1_-ttbjLpp9HMrpWdzSPckZQ](https://user-images.githubusercontent.com/28011628/204269417-e3068e15-e3f7-4cb1-9528-6df97f61ae25.png)



# DNA-Kmer-Speed-Test
DNA Kmer speed test in different languagues

In order to understand the background of this test, visit the original article here: https://towardsdatascience.com/how-fast-is-c-compared-to-python-978f18f474c7


### How to run the test

1. Clone the repository
2. Install the dependencies
3. Run `make LENGTH=11 -s` to run the test with kmer length 11
4. Or use `make LENGTH=13 LANGUAGES="go c cpp rust" -s` to run the test with kmer length 13 and only for the languages go, c, cpp and rust

### Or run the test with docker

1. Clone the repository
2. Install docker
3. Build a docker image using `docker build -t kmers .`
4. Run and connect to the container with `docker run --rm -it kmers`
5. Start the test with `./generate.sh 1 10 >> data.txt`
6. Read the results with `cat data.txt`


### Kmer - Operation Amount

| Kmer | Generated |
|------|-----------|
| 11 | 4.194.304 |
| 12 | 16.777.216 |
| 13 | 67.108.864 |
| 14 | 268.435.456 |
| 15 | 1.073.741.824 |
| 16 | 4.294.967.296 |
| 17 | 17.179.869.184 |


# Test Results

### C

| Kmer | Duration | (Optional) Runtime Env / OS |
|------|----------|-----------------------------|
| 11 | 0.003s | Win11 / i9-12900KF |
| 12 | 0.012s | Win11 / i9-12900KF |
| 13 | 0.045s | Win11 / i9-12900KF |
| 14 | 0.181s | Win11 / i9-12900KF |
| 15 | 0.753s | Win11 / i9-12900KF |
| 16 | 2.887s | Win11 / i9-12900KF |
| 17 | 13.926s | Win11 / i9-12900KF |

### C++

| Kmer | Duration | (Optional) Runtime Env / OS |
|------|----------|-----------------------------|
| 11 | 0.003s | Win11 / i9-12900KF |
| 12 | 0.011s | Win11 / i9-12900KF |
| 13 | 0.055s | Win11 / i9-12900KF |
| 14 | 0.309s | Win11 / i9-12900KF |
| 15 | 1.062s | Win11 / i9-12900KF |
| 16 | 4.149s | Win11 / i9-12900KF |
| 17 | 15.784s | Win11 / i9-12900KF |

### Erlang

| Kmer | Duration | (Optional) Runtime Env / OS |
|------|----------|-----------------------------|
| 11 | 0.375s | Win11 / i9-12900KF |
| 12 | 1.607s | Win11 / i9-12900KF |
| 13 | 6.397s | Win11 / i9-12900KF |
| 14 | 25.117s | Win11 / i9-12900KF |
| 15 | 105.529s | Win11 / i9-12900KF |

### Go

| Kmer | Duration | (Optional) Runtime Env / OS |
|------|----------|-----------------------------|
| 11 | 0.013s | Win11 / i9-12900KF |
| 12 | 0.053s | Win11 / i9-12900KF |
| 13 | 0.213s | Win11 / i9-12900KF |
| 14 | 0.835s | Win11 / i9-12900KF |
| 15 | 3.553s | Win11 / i9-12900KF |
| 16 | 12.429s | Win11 / i9-12900KF |
| 17 | 49.861s | Win11 / i9-12900KF |

### Java

| Kmer | Duration | (Optional) Runtime Env / OS |
|------|----------|-----------------------------|
| 11 | 0.017s | Win11 / i9-12900KF |
| 12 | 0.050s | Win11 / i9-12900KF |
| 13 | 0.158s | Win11 / i9-12900KF |
| 14 | 0.599s | Win11 / i9-12900KF |
| 15 | 2.703s | Win11 / i9-12900KF |

### JavaScript

| Kmer | Duration | (Optional) Runtime Env / OS |
|------|----------|-----------------------------|
| 11 | 0.058s | Win11 / i9-12900KF |
| 12 | 0.225s | Win11 / i9-12900KF |
| 13 | 0.894s | Win11 / i9-12900KF |
| 14 | 3.467s | Win11 / i9-12900KF |
| 15 | 14.543s | Win11 / i9-12900KF |

### Perl

| Kmer | Duration | (Optional) Runtime Env / OS |
|------|----------|-----------------------------|
| 11 | 0.643s | Win11 / i9-12900KF |
| 12 | 2.568 | Win11 / i9-12900KF |
| 13 | 10.182s | Win11 / i9-12900KF |
| 14 | 41.137s | Win11 / i9-12900KF |
| 15 | 169.598s | Win11 / i9-12900KF |

### Python

| Kmer | Duration | (Optional) Runtime Env / OS |
|------|----------|-----------------------------|
| 11 | 2.266s | Win11 / i9-12900KF |
| 12 | 8.850s | Win11 / i9-12900KF |
| 13 | 35.374s | Win11 / i9-12900KF |
| 14 | 99.665s | Win11 / i9-12900KF |
| 15 | 414.169s | Win11 / i9-12900KF |

### Rust

| Kmer | Duration | (Optional) Runtime Env / OS |
|------|----------|-----------------------------|
| 11 | 0.012s | Win11 / i9-12900KF |
| 12 | 0.050s | Win11 / i9-12900KF |
| 13 | 0.202s | Win11 / i9-12900KF |
| 14 | 0.805s | Win11 / i9-12900KF |
| 15 | 3.322s | Win11 / i9-12900KF |
| 16 | 14.338s | Win11 / i9-12900KF |
| 17 | 54.414s | Win11 / i9-12900KF |


### php

| Kmer | Duration | (Optional) Runtime Env / OS |
|------|----------|-----------------------------|
| 11 | 0.561s | Win11 / i9-12900KF |
| 12 | 2.164s | Win11 / i9-12900KF |
| 13 | 8.892s | Win11 / i9-12900KF |
| 14 | 35.038s | Win11 / i9-12900KF |
| 15 | 140.391s | Win11 / i9-12900KF |


# Now it's your turn!

Participate in this public repository with your favourite language
