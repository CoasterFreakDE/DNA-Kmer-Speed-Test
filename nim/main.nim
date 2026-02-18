import os
import strutils
import times

proc convert(c: char): char =
  case c
  of 'A': 'C'
  of 'C': 'G'
  of 'G': 'T'
  of 'T': 'A'
  else: ' '

let length = parseInt(paramStr(1))
var s = newSeq[char](length)
var sLast = newSeq[char](length)

for i in 0 ..< length:
  s[i] = 'A'
  sLast[i] = 'T'

let start = epochTime()
var counter: int64 = 1

while s != sLast:
  counter += 1
  for i in 0 ..< length:
    let old = s[i]
    s[i] = convert(old)
    if old != 'T':
      break

let elapsedMs = (epochTime() - start) * 1000.0
echo "Number of generated k-mers: ", counter, " - took ", elapsedMs, "ms"
