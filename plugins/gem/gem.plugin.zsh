#
# gem: initialize path for gem (ruby)
#

(( $+commands[gem] )) || return 1

export GEM_HOME="$(gem env user_gemhome)"
export PATH="$PATH:$GEM_HOME/bin"
