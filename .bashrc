# If not running interactively, don't do anything
[ -z "$PS1" ] && return

PS1='\[\e]0;\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

alias twitter_check='cd; t timeline -n 200 -l -r -s `tail .timeline -n 1 | cut -d" " -f1` >> .timeline ; sleep 1; /usr/sbin/logtail .timeline; cd -'


export PATH=/home/carlos/.fzf/bin:/home/carlos/.rbenv/shims:/home/carlos/.rbenv/bin:/home/carlos/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/home/carlos/go/bin:/usr/local/go/bin:~/repos/github.com/bebanjo/bj/bin

if [ -d "$HOME/.profile.d" ]; then
    for snippet in $HOME/.profile.d/*; do
        . $snippet
    done
fi

export FZF_DEFAULT_OPTS=-e
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export GOPATH=/home/carlos/go

complete -C /home/carlos/bin/cap.rb -o default cap
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export ANSIBLE_INVENTORY=~/ansible_hosts
export GCE_ACCOUNT_FILE=~/.gce_credentials.json
export TF_VAR_GCE_ACCOUNT_FILE=~/.gce_credentials.json

alias gam="/home/carlos/bin/gam/gam"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/carlos/google-cloud-sdk/path.bash.inc' ]; then source '/home/carlos/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/carlos/google-cloud-sdk/completion.bash.inc' ]; then source '/home/carlos/google-cloud-sdk/completion.bash.inc'; fi
