Example config:

Replace <lang> with the folder name of the language and <display> with the Display name.

speed-test-<lang>.yml
```yml
name: Kmer Speed Test [<display>]

on:
  workflow_dispatch:
  push:
    branches: [ "main" ]
    paths: 
    - "<lang>"
  pull_request:
    branches: [ "main" ]
    paths: 
    - "<lang>"

jobs:
  kmer:
    strategy:
      matrix:
        lang: 
        - "<lang>"
        kmer: [11, 12, 13, 14, 15, 16, 17]
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3
    - name: Create Result dir
      run: mkdir results
    - name: Run Tests
      run: echo "$(make LENGTH=${{ matrix.kmer }} LANGUAGES="${{ matrix.lang }}" -s)" > results/kmer_${{ matrix.kmer }}_${{ matrix.lang }}.result.txt
      id: test
    - name: Save result for kmer ${{ matrix.kmer }} ${{ matrix.lang }}
      uses: actions/upload-artifact@master
      with:
        name: kmer_${{ matrix.kmer }}_${{ matrix.lang }}.result.txt
        path: results/kmer_${{ matrix.kmer }}_${{ matrix.lang }}.result.txt
```
