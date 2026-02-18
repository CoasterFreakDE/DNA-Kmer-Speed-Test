Example config:

Replace `<lang>` with the folder name of the language and `<display>` with the display name.

`speed-test-<lang>.yml`
```yml
name: Kmer Speed Test [<display>]

on:
  workflow_dispatch:
  push:
    branches: ["main"]
    paths:
      - "<lang>/**"
      - "Makefile"
      - ".github/workflows/_speed-test-reusable.yml"
      - ".github/workflows/speed-test-<lang>.yml"
  pull_request:
    branches: ["main"]
    paths:
      - "<lang>/**"
      - "Makefile"
      - ".github/workflows/_speed-test-reusable.yml"
      - ".github/workflows/speed-test-<lang>.yml"

permissions:
  contents: read

jobs:
  kmer:
    uses: ./.github/workflows/_speed-test-reusable.yml
    with:
      display: "<display>"
      lang: "<lang>"
```

Optional inputs supported by the reusable workflow:

- `kmer_values`: JSON array string, for example `"[11,12,13,14,15,16]"`.
- `setup_dotnet_version`: .NET SDK version (for example `"7.x"`).
- `setup_node_version`: Node.js version (for example `"19"`).
- `setup_command`: custom shell setup command (for example installing runtime packages).
