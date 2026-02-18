import os
import time

fn convert(c u8) u8 {
	return match c {
		`A` { `C` }
		`C` { `G` }
		`G` { `T` }
		`T` { `A` }
		else { ` ` }
	}
}

fn main() {
	if os.args.len < 2 {
		println('Usage: v_kmer <length>')
		return
	}

	length := os.args[1].int()
	mut s := []u8{len: length, init: `A`}
	s_last := []u8{len: length, init: `T`}

	start := time.now()
	mut counter := i64(1)

	for s != s_last {
		counter++
		for i := 0; i < length; i++ {
			old := s[i]
			s[i] = convert(old)
			if old != `T` {
				break
			}
		}
	}

	elapsed_ms := time.since(start).milliseconds()
	println('Number of generated k-mers: ${counter} - took ${elapsed_ms}ms')
}
