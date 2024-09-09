#
# install .lessfilter
#

if [ ! -f ${HOME}/.lessfilter ]; then
  ln -s ${ZDOTDIR}/home/.lessfilter ${HOME}/.lessfilter
  chmod +x ${HOME}/.lessfilter
fi
