import time


def convert(c):
	if c == 'A':
		return 'C'
	if c == 'C':
		return 'G'
	if c == 'G':
		return 'T'
	if c == 'T':
		return 'A'


time_start = time.time()
print("Start")

opt = "ACGT"
s = ""
s_last = ""
len_str = 13

for i in range(len_str):
	s += opt[0]

for i in range(len_str):
	s_last += opt[-1]

pos = 0
counter = 1
while s != s_last:
	counter += 1
	for i in range(len_str):
		if s[i] == opt[-1]:
			s = s[:i] + convert(s[i]) + s[i + 1:]
		else:
			s = s[:i] + convert(s[i]) + s[i + 1:]
			break

# You can uncomment the next line to see all k-mers.
# print(s)
time_elapsed = time.time() - time_start
print("Number of generated k-mers: {} - took {}ms".format(counter, time_elapsed * 1000))
print("Finish!")
