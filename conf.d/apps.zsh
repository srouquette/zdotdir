### colemak ---------------------------------------------------------------- {{{

# fix typos
alias cs='cd'  # darn colemak


### dotfiles --------------------------------------------------------------- {{{
alias dotf='cd "$DOTFILES" && $VISUAL .'
alias dotfl='cd "${DOTFILES}.local" && $VISUAL .'


### git -------------------------------------------------------------------- {{{
alias get="git"
alias gadd="git add ."
alias gcom="git checkout master"
alias gcob="git checkout -b"
alias sourcetree='open -a SourceTree'


### golang ----------------------------------------------------------------- {{{
export GLOBALGOPATH=$HOME/Projects/golang
export GOPATH=$GLOBALGOPATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$PATH:$GOPATH/bin # Add GOPATH/bin to PATH for scripting

alias gob='go build'
alias goc='go clean'
alias god='go doc'
alias gof='go fmt'
alias gofa='go fmt . ./...'
alias gog='go get'
alias goi='go install'
alias gol='go list'
alias gor='go run'
alias got='go test'
alias gov='go vet'

resetgopath() {
  export GOPATH=$GLOBALGOPATH
  echo $GOPATH
}

setgopath() {
  export GOPATH="$(pwd)"
  echo $GOPATH
}

goinit() {
  appname="${1:-mynewapp}"
  gitpath="${2:-github.com/mattmc3}"
  mkdir -p "$appname/pkg" "$appname/bin" "$appname/src/$gitpath/$appname"
  export GOPATH="$(pwd)/$appname"
  echo $GOPATH
  $VISUAL "$GOPATH/src/$gitpath/$appname"
}


### groovy ----------------------------------------------------------------- {{{
if [[ "$OSTYPE" == darwin* ]]; then
  export GROOVY_HOME=/usr/local/opt/groovy/libexec  # per homebrew
  export GROOVY_TURN_OFF_JAVA_WARNINGS="true"
fi


### java ------------------------------------------------------------------- {{{
if [[ "$OSTYPE" == darwin* ]]; then
  # run this: /usr/libexec/java_home -v 10
  export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-10.0.2.jdk/Contents/Home"

  # alias j12="export JAVA_HOME=\`/usr/libexec/java_home -v 12\`; java -version"
  # alias j11="export JAVA_HOME=\`/usr/libexec/java_home -v 11\`; java -version"
  # alias j10="export JAVA_HOME=\`/usr/libexec/java_home -v 10\`; java -version"
fi


### jupyter ---------------------------------------------------------------- {{{
alias juno="jupyter notebook"

# jupyter can use the BROWSER variable
# if [[ "$OSTYPE" == darwin* ]]; then
#   export BROWSER=/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome
#   export BROWSER=/Applications/Firefox.app/Contents/MacOS/firefox
# fi


### lpass ------------------------------------------------------------------ {{{
export LPASS_AGENT_TIMEOUT="${LPASS_AGENT_TIMEOUT:-0}"


### macos ------------------------------------------------------------------ {{{
if [[ "$OSTYPE" == darwin* ]]; then
  export HOMEBREW_NO_ANALYTICS=1
  export HOMEBREW_CASK_OPTS="${HOMEBREW_CASK_OPTS:---appdir=/Applications}"
  alias bcu="brew cu"
  alias lmk="say 'Process complete.'"
  alias showfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
  alias hidefiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

  alias brewup="brew update && brew upgrade"
  alias caskup="brew cu -af"
  alias bcu="brew cu"
  alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to clipboard.'"

  # Recursively clean files
  alias cleands="find . -name '.DS_Store' -depth -exec rm {} \;"

  # Canonical hex dump; some systems have this symlinked
  command -v hd > /dev/null || alias hd="hexdump -C"

  # macOS has no 'md5sum', so use 'md5' as a fallback
  command -v md5sum > /dev/null || alias md5sum="md5"

  # macOS has no 'sha1sum', so use 'shasum' as a fallback
  command -v sha1sum > /dev/null || alias sha1sum="shasum"

  # images {{{
  # auto-orient images based on exif tags
  alias autorotate="jhead -autorot"
fi


# python --------------------------------------------------------------------{{{
export WORKON_HOME="${WORKON_HOME:-$XDG_DATA_HOME/venvs}"

alias py2='python2'
alias py3='python3'
alias py='python3'
alias pip2update="pip2 list --outdated | cut -d ' ' -f1 | xargs -n1 pip2 install -U"
alias pip3update="pip3 list --outdated | cut -d ' ' -f1 | xargs -n1 pip3 install -U"
alias pyfind='find . -name "*.py"'
alias pygrep='grep --include="*.py"'
alias pyva="source .venv/bin/activate"

# workon() {
#   [[ -z "$1" ]] && { echo "Expecting workon project name"; return 1; }
#   source "$WORKON_HOME/$1/bin/activate"
# }

# pyclean() {
#   find . -type f -name "*.py[co]" -delete
#   find . -type d -name "__pycache__" -delete
# }

# if [[ -n $WORKON_HOME ]]; then
#   # python: tab complete for workon dir (virtualenv)
#   compdef '_files -W "$WORKON_HOME"' workon &> /dev/null
# fi

# pip_export() {
#   __pip_export "pip" "$@"
# }

# pip2_export() {
#   __pip_export "pip2" "$@"
# }

# pip3_export() {
#   __pip_export "pip3" "$@"
# }

# __pip_export() {
#   $1 freeze
# }

# pip_import() {
#   __pip_import "pip" "$@"
# }

# pip2_import() {
#   __pip_import "pip2" "$@"
# }

# pip3_import() {
#   __pip_import "pip3" "$@"
# }

# __pip_import() {
#   [[ -f "$2" ]] || { echo "Usage: Expecting valid requirements.txt path" >&2; return; }
#   $1 install -r "$2"
# }

# ssh --------------------------------------------------------------------------
# if [[ -f ~/.ssh/id_rsa ]] && ! ssh-add -L >/dev/null; then
#   if [[ "$OSTYPE" == darwin* ]]; then
#     # TODO: review b/c this is a (small) hit performance-wise
#     # macos uses keychain with ssh -K
#     ssh-add -K ~/.ssh/id_rsa &> /dev/null
#   else
#     ssh-add ~/.ssh/id_rsa &> /dev/null
#   fi
# fi
# source "$ZSH"/plugins/sublime/sublime.plugin.zsh

export VISUAL="${VISUAL:-subl}"
alias st="subl"


alias t="todo.sh"
alias todos="$VISUAL $HOME/Desktop/todo.txt"


# zsh
alias cleanzwc="find . -type f -name '*.zwc' -delete"
