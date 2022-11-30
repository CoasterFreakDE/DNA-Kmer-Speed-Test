using BenchmarkTools

function convert(c::Char)
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
  return ' '
end

const opt = "ACGT"

function arrayEquals(a, b)
  return all(x -> x[1] == x[2], zip(a, b))
end

function main(lenStr)
  s = ""
  sLast = ""
  for i in 1:lenStr
    s = s * opt[1]
  end
  for i in 1:lenStr
    sLast = sLast * opt[end]
  end
  ss = collect(s)
  ssLast = collect(sLast)
  counter = 1
  while !arrayEquals(ss, ssLast)
    counter += 1
    # println(ss)
    for i in 1:lenStr
      old = ss[i]
      ss[i] = convert(old)
      if old != opt[end]
        break
      end
    end
  end
  return counter
end

@btime main(5)
