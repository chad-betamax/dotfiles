# don't put duplicate lines in the history
export HISTCONTROL=ignoredups:erasedups

# give history a pretty timesamp
export HISTTIMEFORMAT="%h %d %H:%M $ "

# give us a decent sized history
export HISTSIZE=10000; export HISTFILESIZE=10000

# ignore these commands
export HISTIGNORE="ls:ps:history"

# store multi-line commands in one history entry
shopt -s cmdhist

# append to history (ie don't overwrite)
shopt -s histappend
if [ "$TERM" != "screen" -a -z "$TMUX" ]; then
    # normal shells remember other shells hist
    PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
elif [ "$TERM" = "screen" -a -n "$TMUX" ]; then
    # and tmux sessions just remember their own hist
    PROMPT_COMMAND=$PROMPT_COMMAND
fi

