# Starship faster-than-light

zstyle ':zephyr:plugin:prompt' skip yes

# Load plugin functions.
0=${(%):-%N}
fpath=(${0:A:h}/functions $fpath)
autoload -Uz ${0:A:h}/functions/*(.:t)

function update_starship_completions {
  if [ ! -d $ZSH_COMPLETIONS_DIR ]; then
    echo '$ZSH_COMPLETIONS_DIR is undefined or does not exists.'
    return 0
  fi
  local dest=${1:-$ZSH_COMPLETIONS_DIR}
  starship completions zsh >| $dest/_starship
}

# Add completions
[[ -f ${ZSH_COMPLETIONS_DIR}/_starship ]] || update_starship_completions
