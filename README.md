![1_-ttbjLpp9HMrpWdzSPckZQ](https://user-images.githubusercontent.com/28011628/204269417-e3068e15-e3f7-4cb1-9528-6df97f61ae25.png)



# DNA-Kmer-Speed-Test
DNA Kmer speed test in different languagues

In order to understand the background of this test, visit the original article here: https://towardsdatascience.com/how-fast-is-c-compared-to-python-978f18f474c7


### Kmer - Operation Amount

| Kmer | Generated |
|------|-----------|
| 13 | 67.108.864 |
| 14 | 268.435.456 |
| 15 | 1.073.741.824 |
| 16 | 4.294.967.296 |
| 17 | 17.179.869.184 |


# Test Results

### Python

| Language | Kmer | Duration | (Optional) Runtime Env / OS |
|----------|------|----------|-----------------------------|
| Python 3.11 | 13 | 25.221s | Win11 / i9-12900KF |
| Python 3.11 | 14 | 99.665s | Win11 / i9-12900KF |
| Python 3.11 | 15 | 414.169s | Win11 / i9-12900KF |

### Rust

| Language | Kmer | Duration | (Optional) Runtime Env / OS |
|----------|------|----------|-----------------------------|
| Rust 1.65.0 | 13 | 0.204s | Win11 / i9-12900KF |
| Rust 1.65.0 | 14 | 0.822s | Win11 / i9-12900KF |
| Rust 1.65.0 | 15 | 3.322s | Win11 / i9-12900KF |
| Rust 1.65.0 | 16 | 14.338s | Win11 / i9-12900KF |
| Rust 1.65.0 | 17 | 54.414s | Win11 / i9-12900KF |

### Go

| Language | Kmer | Duration | (Optional) Runtime Env / OS |
|----------|------|----------|-----------------------------|
| Go 1.18.3 | 13 | 0.195s | Win11 / i9-12900KF |
| Go 1.18.3 | 14 | 0.782s | Win11 / i9-12900KF |
| Go 1.18.3 | 15 | 3.138s | Win11 / i9-12900KF |
| Go 1.18.3 | 16 | 12.429s | Win11 / i9-12900KF |
| Go 1.18.3 | 17 | 49.861s | Win11 / i9-12900KF |



# Now it's your turn!

Participate in this public repository with your favourite language
