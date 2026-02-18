#!/usr/bin/env bash
set -euo pipefail

length="${1:-5}"
languages="${LANGUAGES:-c cpp erlang go java js perl python rust haskell csharp coffeescript lua mojo}"
optional_languages="${OPTIONAL_LANGUAGES:-mojo}"

contains_word() {
  local needle="$1"
  shift
  for item in "$@"; do
    if [[ "$item" == "$needle" ]]; then
      return 0
    fi
  done
  return 1
}

read -r -a lang_list <<<"$languages"
read -r -a optional_list <<<"$optional_languages"

pass=0
skip=0
fail=0

for lang in "${lang_list[@]}"; do
  echo "==> Testing ${lang} (k=${length})"
  if bash scripts/test_language.sh "$lang" "$length"; then
    pass=$((pass + 1))
    continue
  fi

  exit_code=$?
  if [[ "$exit_code" -eq 2 ]] && contains_word "$lang" "${optional_list[@]}"; then
    echo "SKIP ${lang}: optional runtime not available"
    skip=$((skip + 1))
    continue
  fi

  echo "FAIL ${lang}"
  fail=$((fail + 1))
done

echo ""
echo "Test summary: pass=${pass}, skip=${skip}, fail=${fail}"
if [[ "$fail" -gt 0 ]]; then
  exit 1
fi
