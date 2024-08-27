#
# git
#

# References
# - https://www.oliverspryn.com/blog/adding-git-completion-to-zsh

function update_git_completions {
  if [ ! -d ${ZSH_COMPLETIONS_DIR} ]; then
    echo '$ZSH_COMPLETIONS_DIR is undefined or does not exists.'
    return 0
  fi
  # Download the git scripts
  local bsh_url=https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
  local zsh_url=https://raw.githubusercontent.com/felipec/git-completion/master/git-completion.zsh
  local dest=${1:-$ZSH_COMPLETIONS_DIR}
  curl -fsSL $bsh_url -o $dest/git-completion.bash
  curl -fsSL $zsh_url -o $dest/_git
}

# Add completions
[[ -f ${ZSH_COMPLETIONS_DIR}/_git ]] || update_git_completions
zstyle ':completion:*:*:git:*' script ${ZSH_COMPLETIONS_DIR}/git-completion.bash

# Aliases
alias gad="git add"
alias gbn="git rev-parse --abbrev-ref HEAD"
alias gcd1="git clone --depth 1 https://github.com/"
alias gcl="git clean"
alias gclone="git clone git@github.com:mattmc3/"
alias gcmt="git commit -am "
alias gco="git checkout"
alias gcob="git checkout -b "
alias gcod="git checkout develop"
alias gcom="git checkout main"
alias get="git"
alias glg="git log"
alias glog="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias gpll="git pull"
alias gpristine="git reset --hard && git clean -fdx"
alias gpsh="git push"
alias gpsuo="git push --set-upstream origin (git rev-parse --abbrev-ref HEAD)"
alias grv="git remote -v"
alias gsh="git stash"
alias gst="git status -sb"

