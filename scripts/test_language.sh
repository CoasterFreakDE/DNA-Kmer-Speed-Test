#!/usr/bin/env bash
set -euo pipefail

lang="${1:-}"
length="${2:-5}"
allow_missing_runtime="${ALLOW_MISSING_RUNTIME:-false}"

if [[ -z "$lang" ]]; then
  echo "Usage: $0 <language> [length]" >&2
  exit 1
fi

required_cmd_for_lang() {
  case "$1" in
    c) echo "gcc" ;;
    cpp) echo "g++" ;;
    csharp) echo "dotnet" ;;
    coffeescript) echo "coffee" ;;
    erlang) echo "erl" ;;
    go) echo "go" ;;
    haskell) echo "cabal" ;;
    java) echo "java" ;;
    js) echo "node" ;;
    lua) echo "luajit" ;;
    mojo) echo "mojo" ;;
    perl) echo "perl" ;;
    php) echo "php" ;;
    python) echo "python" ;;
    rust) echo "cargo" ;;
    *)
      echo "Unknown language '${1}'" >&2
      exit 1
      ;;
  esac
}

required_cmd="$(required_cmd_for_lang "$lang")"
if ! command -v "$required_cmd" >/dev/null 2>&1; then
  if [[ "$allow_missing_runtime" == "true" ]]; then
    echo "SKIP ${lang}: missing required command '${required_cmd}'"
    exit 0
  fi
  echo "Missing required command '${required_cmd}' for language '${lang}'" >&2
  exit 2
fi

output="$(make LENGTH="$length" LANGUAGES="$lang" -s)"
echo "$output"

count="$(echo "$output" | sed -nE 's/.*Number of generated k-mers: ([0-9]+).*/\1/p' | head -n 1)"
duration="$(echo "$output" | awk -F ' - took ' '/Number of generated k-mers:/ { print $2; exit }')"

if [[ -z "$count" ]]; then
  echo "Could not parse generated k-mer count for '${lang}'" >&2
  exit 1
fi

if [[ -z "$duration" ]]; then
  echo "Could not parse duration output for '${lang}'" >&2
  exit 1
fi

expected=1
for ((i = 0; i < length; i++)); do
  expected=$((expected * 4))
done

if [[ "$count" -ne "$expected" ]]; then
  echo "Unexpected count for '${lang}': got ${count}, expected ${expected}" >&2
  exit 1
fi

echo "PASS ${lang}: count=${count}, expected=${expected}, duration=${duration}"
