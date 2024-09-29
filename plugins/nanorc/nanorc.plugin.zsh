#
# update .nanorc
#

function update_nanorc {
  paths=(
    "/usr/share/nano"
    "/usr/share/nano/extra"
    "/usr/share/local/nano"
    '/usr/share/nano-syntax-highlighting'
    "$HOME/.nano"
    "$HOME/.local/share/nano"
  )
  for p in $paths; do
    [ -d $p ] || continue
    echo "include $p/*.nanorc" >| ~/.nanorc
    return
  done
}

[ -f "$HOME/.nanorc" ] || update_nanorc
