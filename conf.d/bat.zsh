#
# Configure bat
#

(( $+commands[bat] )) || return 1

export BAT_CONFIG_DIR="${XDG_CONFIG_HOME}/bat"
export BAT_THEME='rose-pine'

function update_bat_theme {
  local dest=${BAT_CONFIG_DIR}/themes
  [ -d $dest ] || mkdir -p $dest

  # https://raw.githubusercontent.com/rose-pine/tm-theme/main/dist/themes/rose-pine.tmTheme
  curl -fsSL https://raw.githubusercontent.com/srouquette/dotfiles/main/dot_config/bat/themes/rose-pine.tmTheme \
    -o ${dest}/rose-pine.tmTheme

  bat cache --build
}

[ -f ${BAT_CONFIG_DIR}/themes/rose-pine.tmTheme ] || update_bat_theme

