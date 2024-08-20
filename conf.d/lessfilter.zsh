#
# install .lessfilter
#

function update_lessfilter {
  curl -fsSL https://raw.githubusercontent.com/Freed-Wu/Freed-Wu/main/.lessfilter \
    -o ${HOME}/.lessfilter
}

[ -f ${HOME}/.lessfilter ] || update_lessfilter

export LESS="${LESS:--FgiMRSX -z 6 --wheel-lines 6 --mouse}"
