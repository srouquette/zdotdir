#
# install .lessfilter
#

if [ ! -f ${HOME}/.lessfilter ]; then
  ln -s ${ZDOTDIR}/home/.lessfilter ${HOME}/.lessfilter
fi

chmod +x ${ZDOTDIR}/home/.lessfilter
chmod +x ${HOME}/.lessfilter
