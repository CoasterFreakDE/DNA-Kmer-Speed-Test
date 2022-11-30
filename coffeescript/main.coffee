performance = require("perf_hooks").performance

convert = (c) ->
  if c is "A"
    return "C"
  if c is "C"
    return "G"
  if c is "G"
    return "T"
  if c is "T"
    return "A"
  return " "

lenStr = parseInt process.argv[2]
timeStart = performance.now()

opt = "ACGT"
s = ""
sLast = ""

for i in [0...lenStr]
  s += opt[0]

for i in [0...lenStr]
  sLast += opt[opt.length - 1]

ss = s.split("")
ssLast = sLast.split("")

counter = 1

arrayEquals = (a, b) ->
  a.every (val, index) -> val is b[index]

while not arrayEquals(ss, ssLast)
  counter++
  # console.log(ss.join(""))
  for i in [0...lenStr]
    old = ss[i]
    ss[i] = convert old
    if old isnt opt[opt.length - 1]
      break

timeElapsed = performance.now() - timeStart
console.log "Number of generated k-mers: #{counter} - took #{timeElapsed}ms"