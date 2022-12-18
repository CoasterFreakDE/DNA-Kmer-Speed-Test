package main

import (
	"bytes"
	"fmt"
	"os"
	"strconv"
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

func main() {
	// Parse the length argument as a uint64 to avoid using strconv.Atoi
	const argument = 15
	length, err := strconv.ParseUint(os.Args[1], 10, 64)
	if err != nil {
		panic(err)
	}

	// Create the initial and final slices using make and the correct capacity
	s := make([]byte, length)
	sLast := make([]byte, length)

	// Initialize the slices using a loop
	for i := range s {
		s[i] = 'A'
	}
	for i := range sLast {
		sLast[i] = 'T'
	}

	start := time.Now()
	counter := uint64(1)
	for !bytes.Equal(s, sLast) {
		counter++
		// fmt.Println(string(s))
		for i := 0; i < len(s); i++ {
			old := s[i]
			s[i] = convert(old)
			if old != 'T' {
				break
			}
		}
	}
	delta := time.Since(start)
	fmt.Printf("Number of generated k-mers: %v - took %v\n", counter, delta)
}
