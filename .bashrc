# Aliases
alias ls="ls -F"
alias pwgen="pwgen -cny"

# Prompt
PS1='[\u@\h \w]\\$ '

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
    ;;
*)
    ;;
esac

# https://stackoverflow.com/questions/1401002/trick-an-application-into-thinking-its-stdout-is-a-terminal-not-a-pipe
faketty() {
    script --return -qfc "$(printf "%q " "$@")" /dev/null
}
