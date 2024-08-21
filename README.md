# zdotdir

My `$ZDOTDIR` directory, which contains my zsh configuration, based on [mattmc3's zdotdir][mattmc3's zdotdir].

## Installation

Install this repo to your `$ZDOTDIR`:

```zsh
# set the amazing ZDOTDIR variable
export ZDOTDIR=~/.config/zsh

# clone this repo
git clone --recursive git@github.com:srouquette/zdotdir.git $ZDOTDIR

# change the root .zshenv file to use ZDOTDIR
cat << 'EOF' >| ~/.zshenv
export ZDOTDIR=~/.config/zsh
[[ -f $ZDOTDIR/.zshenv ]] && . $ZDOTDIR/.zshenv
EOF

# or symlink the files from $ZDOTDIR/home in your home
ln -s $ZDOTDIR/home/.zshenv ~/.zshenv

# load zsh
zsh
```

I'm also using [chezmoi][chezmoi] to setup my [dotfiles][Syl's dotfiles].

## Resources

- [Syl's dotfiles][Syl's dotfiles]
- [mattmc3's zdotdir][mattmc3's zdotdir]
- [Isaac Summers's zdotdir][Isaac Summers's zdotdir]
- [wzy's .lessfilter][wzy's .lessfilter]
- [Wolfgang Friebel's lesspipe][Wolfgang Friebel's lesspipe]
- [chezmoi][chezmoi]

[Syl's dotfiles]:               https://github.com/srouquette/dotfiles
[mattmc3's zdotdir]:            https://github.com/mattmc3/zdotdir
[Isaac Summers's zdotdir]:      https://github.com/isaacsummers/zdotdir/tree/develop
[wzy's .lessfilter]:            https://raw.githubusercontent.com/Freed-Wu/Freed-Wu/main/.lessfilter
[Wolfgang Friebel's lesspipe]:  https://github.com/wofr06/lesspipe
[chezmoi]:                      https://www.chezmoi.io/
