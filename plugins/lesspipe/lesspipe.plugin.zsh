#
# install lesspipe.sh
#

function update_lesspipe {
  local dest=${HOME}/.local/bin
  [ -d $dest ] || mkdir -p $dest

  curl -fsSL https://raw.githubusercontent.com/wofr06/lesspipe/lesspipe/lesspipe.sh \
    -o ${dest}/lesspipe.sh
}

(( $+commands[lesspipe.sh] )) || update_lesspipe

export LESSOPEN="${LESSOPEN:-| lesspipe.sh %s 2>-}"
