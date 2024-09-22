#
# update .nanorc
#

function update_nanorc {
  paths=(
    '/usr/share/nano-syntax-highlighting'
    "$HOME/.nanorc"
  )
  for p in $paths; do
    [ -d $p ] || continue
    echo "include $p/*.nanorc" >| ~/.nanorc
    return
  done
}

[ -f "$HOME/.nanorc" ] || update_nanorc
