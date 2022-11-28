package main

import (
	"bytes"
	"fmt"
	"time"
)

func convert(c byte) byte {
	switch c {
	case 'A':
		return 'C'
	case 'C':
		return 'G'
	case 'G':
		return 'T'
	case 'T':
		return 'A'
	}
	return ' '
}

const length = 15

func main() {
	start := time.Now()
	base := "ACGT"
	end := base[len(base) - 1]
	s := ""
	for i := 0; i < length; i++ {
		s += string(base[0])
	}
	sLast := ""
	for i := 0; i < length; i++ {
		sLast += string(end)
	}
	ss := []byte(s)
	ssLast := []byte(sLast)
	counter := uint64(1)
	for !bytes.Equal(ss, ssLast) {
		counter++
		// fmt.Println(string(ss))
		for i := 0; i < length; i++ {
			old := ss[i]
			ss[i] = convert(old)
			if old != end {
				break
			}
		}
	}
	delta := time.Since(start)
	fmt.Printf("Number of generated k-mers: %v - took %v\n", counter, delta)
}