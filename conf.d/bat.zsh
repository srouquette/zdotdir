#
# Configure bat
#

export BAT_CONFIG_DIR="${XDG_CONFIG_HOME}/bat"
export BAT_THEME='rose-pine'

function update_theme {
  local dest=${BAT_CONFIG_DIR}/themes
  [ -d $dest ] || mkdir -p $dest

  curl -fsSL https://raw.githubusercontent.com/rose-pine/tm-theme/main/dist/themes/rose-pine.tmTheme \
    -o ${dest}/rose-pine.tmTheme
}

[ -f ${BAT_CONFIG_DIR}/themes/rose-pine.tmTheme ] || update_theme

[ -z "$(bat --list-themes | grep ${BAT_THEME} 2>&1)" ] && bat cache --build
