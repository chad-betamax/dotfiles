#this file is read by the ~/.bashrc file


# alias .bash='just --justfile ~/.local/bin/metatools/bash.justfile'


# the dotfile config files manager
alias cz='chezmoi'
# needed so bash completions work for the cz alias as well as the command chezmoi
complete -F __start_chezmoi cz

alias todo='todotxt-tui'

alias pingg='ping google.com'

alias du='du -h'
alias dutop='du --max-depth=1'
alias df='df -h -x tmpfs'
alias dft='df -T'
alias mount='mount|grep ^\/dev'

alias ls='ls --color=auto'
alias ll='ls -lAh'
alias lso='stat -c "%a %A %U:%G %s %n" *'
alias lsg='ls|grep'
alias la='ls -A'
alias lc='caja --no-desktop --browser .'

alias cp='cp -v'
alias rm='rm -v'
alias mv='mv -v'

alias ps='ps -e'
alias psg='ps -e|grep'

# read files without comments
# used at end of pipe eg:  $ cat somefile|nc
alias nc='grep -v ^#| sed "/^$/d"'

# substitute htop for top cos top is crap
alias top='htop'

# using neovim now
alias nv=nvim

alias untar='tar -xvzf'

# a better version of cat
alias cat='bat -pp'

# some sane options for pwgen
alias pwgen='pwgen -1 --ambiguous --capitalize --numerals'

# Git stuff
alias gcomp='git diff HEAD~1 --'
alias gcomp2='git diff HEAD~2 --'

# Tmux sessions
#alias sp='exec ~/.local/bin/spawntmux.sh --local'
# alias spr='exec ~/.local/bin/spawntmux.sh --remote'
# alias todo='exec ~/.local/bin/spawntoodoux.sh'
# alias tml='tmux new -s' 

alias dc='docker-compose'

# Run unit tests; the happy path
# alias unit='docker-compose exec roles pytest --verbose --no-summary --no-header tests/unit'
# Run unit tests; bail on first error and print summary
# alias uniterr='docker-compose exec roles pytest --verbose -x tests/unit'

# Run integration tests; the happy path
#alias intg='docker-compose exec roles pytest --verbose --no-summary --no-header tests/integration'
# Run integration tests; bail on first error and print summary
#alias intgerr='docker-compose exec roles pytest --verbose -x tests/integration'



