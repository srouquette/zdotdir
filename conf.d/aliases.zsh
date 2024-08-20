# ssh
alias sshrem='ssh-add -D'
alias sshall='fd $HOME/.ssh -type f -regex ".*/id_[^.]*$" | xargs ssh-add'
alias sshdir='cd $HOME/.ssh'
alias sshconfig='code $HOME/.ssh/config'
alias sshcreate='cd $HOME/.ssh && ssh-keygen -t ed25519 -C ${HOST%%.local}'
alias sshlist='ssh-add -l'

alias ppath='echo ${PATH//:/\\n}'
alias fppath='echo ${FPATH//:/\\n}'
alias ag='alias | grep'

# zsh
alias zreload='exec zsh -l'
alias zrr='exec zsh -l'
alias arr='. $ZDOTDIR/conf.d/aliases.zsh'
alias zcompdir='zcompiledir'
alias zcheat='code $ZDOTDIR/.docs/zsh-cheatsheet.md'
alias zstring='code $ZDOTDIR/.docs/zsh-string.md'
alias zdotc='open $HOME/.config/zsh/zsh.code-workspace'
alias aliasedit='$EDITOR $ZDOTDIR/conf.d/aliases.zsh'
alias plugedit='$EDITOR $ZDOTDIR/.zplugins'

# custom
alias pacmanQR='pacman -Qqdt | pacman -Rsnu -'
alias cdw='cd "${XDG_DATA_HOME}"'
