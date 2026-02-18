Speed test workflows are now split into:

- `speed-test.yml` (single matrix entrypoint for all languages)
- `_speed-test-reusable.yml` (shared implementation used by the matrix)

To add a new language in one place, edit the `matrix.include` list in `speed-test.yml`.
Each item maps directly to one reusable invocation:

```yml
jobs:
  speed-test:
    strategy:
      matrix:
        include:
          - display: "MyLang"
            lang: "mylang"
            kmer_values: "[11,12,13,14,15]"
            setup_dotnet_version: ""
            setup_node_version: ""
            setup_command: ""
    uses: ./.github/workflows/_speed-test-reusable.yml
```

Supported reusable inputs:

- `display`: language display name shown in summary
- `lang`: language folder name used in `make LANGUAGES=<lang>`
- `kmer_values`: JSON array string, for example `"[11,12,13,14,15,16]"`
- `setup_dotnet_version`: .NET SDK version (for example `"6.x"` or `"8.x"`)
- `setup_node_version`: Node.js version (for example `"20"`)
- `setup_command`: custom shell setup command for runtime/install steps
