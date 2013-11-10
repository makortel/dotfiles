# Aliases
alias ls="ls -F"
alias pwgen="pwgen -cny"

# Prompt
PS1='[\u@\h \w]\\$ '

# history
HISTCONTROL=ignoreboth


# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
    ;;
*)
    ;;
esac
