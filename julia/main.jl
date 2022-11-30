using BenchmarkTools
function convert(c)
    if c == 'A'
        return 'C'
    end
    if c == 'C'
        return 'G'
    end
    if c == 'G'
        return 'T'
    end
    if c == 'T'
        return 'A'
    end
end
@benchmark begin
    println("Start")
    opt = "ACGT"
    s = ""
    s_last = ""
    len_str = 13
    for i in 1:len_str
        s *= opt[1]
    end
    for i in 1:len_str
        s_last *= opt[end]
    end
    pos = 0
    counter = 1
    while s != s_last
        counter += 1
        for i in 1:len_str
            if s[i] == opt[end]
                s = s[1:i-1] * convert(s[i]) * s[i+1:end]
            else
                s = s[1:i-1] * convert(s[i]) * s[i+1:end]
                break
            end
        end
        # println(s)
    end
   println("k-mers: ", counter)
   exit()
end