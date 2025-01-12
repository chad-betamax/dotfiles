#this file is read by the ~/.bashrc file


# Some of the below functions are called by .bashrc while
# others are intended to be called directly on the command line


# Automatically do an ls after each cd
cd() {
    if [ -n "$1" ]; then
        builtin cd "$@" && ls
    else
        builtin cd ~ && ls
    fi
}

# display the branch in prompt if in git repo
parse_git_branch(){
    branch="$(git symbolic-ref --short -q HEAD 2>/dev/null)"
    [[ ${#branch} > 0 ]] && echo "($branch)"
}

# colourise the prompt, different users, different colours
colourprompt() {
    case $USER in
        root)
          # light yellow
          colour='1;33m' 
          ;;
        doug)
          # light blue
          colour='1;34m' 
          ;;
        *)
          # cyan
          colour='1;36m'
          ;;
    esac

    # note we incorporate the git branch function
    PS1="\[\033[$colour\][\u@\h:\w]$\[\033[31m\]\$(parse_git_branch)\[\033[0m\] "
}



# cd up dirs as many times as you like eg just do ".. 6" to go up x6 dirs
function ..() {
  for i in $(seq 1 $1); do cd ..; done
}

# Cache the ssh-agent for the session; so we only have to 
# provide the passphrase for the sshkey once per login
function SSHsession() {
    local KEY=$1
    if [[ -z "$KEY" ]]; then
      echo 'no sshkey specified'
      return 1
    fi

    if [[ -x /usr/bin/keychain ]]; then
       eval $(keychain --quiet --eval $KEY)
    else
       echo 'install keychain for ssh-agent caching to work'
    fi
}


# Provided a bunch of paths; add em to the user's PATH
# TODO check for doublers
function set_PATH() {
    for i in $@;
    do
      if [ -d "$i" ]; then
        PATH=:$PATH
	PATH=$i${PATH//:$i:/:}
      fi
    done
}

# Set terminal title dynamically when using $EDITOR
case $TERM in
  xterm*|rxvt*|mate-terminal*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
    function preexec() {
      # Set title to the file being edited
      case "$1" in
        *"$EDITOR"*) echo -ne "\033]0;Editing: ${1##* }\007" ;;
      esac
    }

    function precmd() {
      # Reset to default after command execution
      echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"
    }

    trap 'preexec "$BASH_COMMAND"' DEBUG
    PROMPT_COMMAND="${PROMPT_COMMAND}; precmd"
    ;;
esac

# Create an alias for every recipe in a supplied justfile
# https://just.systems/man/en/global-and-user-justfiles.html
just-tools() {
    for REC in $(just --justfile ~/$1 --summary); do
    	alias $REC="just --justfile ~/$1 --working-directory . $REC"
    done
}

# Not strictly speaking a function... still this is the best place for it.
# bash auto-completes for the todotxt.tui to-do list thingo
source <(todotxt-tui --export-autocomplete /dev/stdout)
