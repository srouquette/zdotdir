#
# install .lessfilter
#

function update_lessfilter {
  curl -fsSL https://raw.githubusercontent.com/Freed-Wu/Freed-Wu/main/.lessfilter \
    -o ${HOME}/.lessfilter
  chmod +x ${HOME}/.lessfilter
}

[ -f ${HOME}/.lessfilter ] || update_lessfilter
