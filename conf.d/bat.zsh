#
# Configure bat
#

(( $+commands[bat] )) || return 1

export BAT_CONFIG_DIR=${XDG_CONFIG_HOME}/bat
export BAT_THEME=${BAT_THEME:-rose-pine}

function _bat_cache_build {

  # download the theme if it isn't present
  if [ ! -f ${BAT_CONFIG_DIR}/themes/${BAT_THEME}.tmTheme ]; then
    local dest=${BAT_CONFIG_DIR}/themes
    [ -d $dest ] || mkdir -p $dest
    # https://raw.githubusercontent.com/rose-pine/tm-theme/main/dist/themes/rose-pine.tmTheme
    curl -fsSL https://raw.githubusercontent.com/srouquette/dotfiles/main/dot_config/bat/themes/${BAT_THEME}.tmTheme \
      -o ${dest}/${BAT_THEME}.tmTheme
  fi

  bat cache --build &>/dev/null &
}

bat --list-themes | grep $BAT_THEME &>/dev/null || _bat_cache_build
