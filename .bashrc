# If not running interactively, don't do anything
[ -z "$PS1" ] && return

PS1='\[\e]0;\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

export PATH=/home/carlos/.fzf/bin:/home/carlos/.rbenv/shims:/home/carlos/.rbenv/bin:/home/carlos/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

if [ -d "$HOME/.profile.d" ]; then
    for snippet in $HOME/.profile.d/[0-9]*; do
        . $snippet
    done
fi

export FZF_DEFAULT_OPTS=-e
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
