require 'benchmark'

def convert(c)
  if c == 'A'
    'C'
  elsif c == 'C'
    'G'
  elsif c == 'G'
    'T'
  elsif c == 'T'
    'A'
  else
    ' '
  end
end

len_str = ARGV[0].to_i
time_start = Time.now

opt = 'ACGT'
s = ''
s_last = ''

len_str.times do
  s += opt[0]
end

len_str.times do
  s_last += opt[-1]
end

ss = s.split('')
ss_last = s_last.split('')

counter = 1

def array_equals(a, b)
  a.each_with_index.all? { |val, index| val == b[index] }
end

until array_equals(ss, ss_last)
  counter += 1
  # comment this out to see the logs
  # p ss.join
  len_str.times do |i|
    old = ss[i]
    ss[i] = convert(old)
    break if old != opt[-1]
  end
end

time_elapsed = Time.now - time_start
puts "Number of generated k-mers: #{counter} - took #{time_elapsed}ms"