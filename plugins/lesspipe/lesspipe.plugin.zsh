#
# install lesspipe.sh
#

function update_lesspipe {
  local dest=${HOME}/.local/bin
  [ -d $dest ] || mkdir -p $dest

  curl -fsSL https://raw.githubusercontent.com/wofr06/lesspipe/lesspipe/lesspipe.sh \
    -o ${dest}/lesspipe.sh
}

[ $(command -v lesspipe.sh 2>&1) ] || update_lesspipe

export LESSOPEN="${LESSOPEN:-| lesspipe.sh %s 2>-}"
