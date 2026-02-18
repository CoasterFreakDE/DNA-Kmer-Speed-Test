def convert(c : Char) : Char
  case c
  when 'A' then 'C'
  when 'C' then 'G'
  when 'G' then 'T'
  when 'T' then 'A'
  else ' '
  end
end

if ARGV.size < 1
  puts "Usage: crystal_kmer <length>"
  exit 1
end

length = ARGV[0].to_i
s = Array(Char).new(length, 'A')
s_last = Array(Char).new(length, 'T')

start = Time.monotonic
counter = 1_i64

while s != s_last
  counter += 1
  (0...length).each do |i|
    old = s[i]
    s[i] = convert(old)
    break if old != 'T'
  end
end

elapsed_ms = (Time.monotonic - start).total_milliseconds
puts "Number of generated k-mers: #{counter} - took #{elapsed_ms}ms"
