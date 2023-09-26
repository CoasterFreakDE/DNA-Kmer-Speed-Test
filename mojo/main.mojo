import time
from sys import argv

fn convert(c: String) -> String:
    if c == 'A':
        return 'C'
    if c == 'C':
        return 'G'
    if c == 'G':
        return 'T'
    if c == 'T':
        return 'A'
    return ''

fn stringToInt(s: String) -> Int:
    var res: Int = 0
    try:
        res = atol(s)
    except:
        res = 0
    return res

fn main():
    let time_start = time.now()
    let opt: String = "ACGT"
    let opt_len: Int = len(opt)
    var s: String = ""
    var s_last: String = ""
    let len_str: Int = stringToInt(argv()[1])

    for i in range(len_str):
        s += opt[0]

    for i in range(len_str):
        s_last += opt[opt_len - 1]

    var counter: Int = 1
    while(s != s_last):
        counter += 1
        for i in range(len_str):
            if (s[i] == opt[opt_len - 1]):
                s = s[:i] + convert(s[i]) + s[i+1:]
            else:
                s = s[:i] + convert(s[i]) + s[i+1:]
                break

    # You can uncomment the next line to see all k-mers.
    # print(s)
    let time_elapsed = time.now() - time_start
    print("Number of generated k-mers:", counter, "- took", time_elapsed / 1000000, "ms")