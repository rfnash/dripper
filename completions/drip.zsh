if [[ ! -o interactive ]]; then
    return
fi

compctl -K _drip drip

_drip() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(drip commands)"
  else
    completions="$(drip completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
