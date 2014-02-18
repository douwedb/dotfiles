#
# ~/.bashrc
#

# If not running interactively, don't do anything.
[ -z "$PS1" ] && return

# Editors.
export EDITOR="vim"
# export VISUAL="gvim"

# Less.
export LESS="-R --LONG-PROMPT --ignore-case --QUIET"

# Vi/VIM style Bash keybindings. Enable this if you like those.
set -o vi

# Reset.
Colour_Off="\e[0m"      # Text Reset.

# Regular Colours.
Black="\e[0;30m"        # Black.
Red="\e[0;31m"          # Red.
Green="\e[0;32m"        # Green.
Yellow="\e[0;33m"       # Yellow.
Blue="\e[0;34m"         # Blue.
Purple="\e[0;35m"       # Purple.
Cyan="\e[0;36m"         # Cyan.
White="\e[0;37m"        # White.

# Bold.
BBlack="\e[1;30m"       # Black.
BRed="\e[1;31m"         # Red.
BGreen="\e[1;32m"       # Green.
BYellow="\e[1;33m"      # Yellow.
BBlue="\e[1;34m"        # Blue.
BPurple="\e[1;35m"      # Purple.
BCyan="\e[1;36m"        # Cyan.
BWhite="\e[1;37m"       # White.

# Underline.
UBlack="\e[4;30m"       # Black.
URed="\e[4;31m"         # Red.
UGreen="\e[4;32m"       # Green.
UYellow="\e[4;33m"      # Yellow.
UBlue="\e[4;34m"        # Blue.
UPurple="\e[4;35m"      # Purple.
UCyan="\e[4;36m"        # Cyan.
UWhite="\e[4;37m"       # White.

# Background.
On_Black="\e[40m"       # Black.
On_Red="\e[41m"         # Red.
On_Green="\e[42m"       # Green.
On_Yellow="\e[43m"      # Yellow.
On_Blue="\e[44m"        # Blue.
On_Purple="\e[45m"      # Purple.
On_Cyan="\e[46m"        # Cyan.
On_White="\e[47m"       # White.

# High Intensty.
IBlack="\e[0;90m"       # Black.
IRed="\e[0;91m"         # Red.
IGreen="\e[0;92m"       # Green.
IYellow="\e[0;93m"      # Yellow.
IBlue="\e[0;94m"        # Blue.
IPurple="\e[0;95m"      # Purple.
ICyan="\e[0;96m"        # Cyan.
IWhite="\e[0;97m"       # White.

# Bold High Intensty.
BIBlack="\e[1;90m"      # Black.
BIRed="\e[1;91m"        # Red.
BIGreen="\e[1;92m"      # Green.
BIYellow="\e[1;93m"     # Yellow.
BIBlue="\e[1;94m"       # Blue.
BIPurple="\e[1;95m"     # Purple.
BICyan="\e[1;96m"       # Cyan.
BIWhite="\e[1;97m"      # White.

# High Intensty backgrounds.
On_IBlack="\e[0;100m"   # Black.
On_IRed="\e[0;101m"     # Red.
On_IGreen="\e[0;102m"   # Green.
On_IYellow="\e[0;103m"  # Yellow.
On_IBlue="\e[0;104m"    # Blue.
On_IPurple="\e[10;95m"  # Purple.
On_ICyan="\e[0;106m"    # Cyan.
On_IWhite="\e[0;107m"   # White.

# Turn on colours.
case "$TERM" in
    *color*)
    color_prompt=yes;;
esac

# Set GUI terminal titles.
case "$TERM" in
*xterm*|rxvt*|Eterm|aterm|kterm|gnome*|interix)
    PROMPT_COMMAND='echo -ne "\e]0;${USER}@${HOSTNAME}\007"'
    ;;
*)
    ;;
esac

# Prompt, looks like:
# ┌─[username@host]-[time date]-[directory]
# └─[$]-> 
if [ -n "$SSH_CLIENT" ]; then
	export PS1="\[$Cyan\]┌─[\[$Green\]\u\[$Blue\]@\[$Red\]\h\[$Cyan\]]-[\[$IRed\]\t $(date +'%a %d %m')\[$Cyan\]]-[\[$BYellow\]\w\[$Cyan\]]\n\[$Cyan\]└─[\[$IRed\]SSH\[$Cyan\]]-[\[$Purple\]\$\[$Cyan\]]->\[$Colour_Off\] "
else
	export PS1="\[$Cyan\]┌─[\[$Green\]\u\[$Blue\]@\[$Red\]\h\[$Cyan\]]-[\[$Colour_Off\]\t $(date +'%a %d %b')\[$Cyan\]]-[\[$BYellow\]\w\[$Cyan\]]\n\[$Cyan\]└─[\[$Purple\]\$\[$Cyan\]]->\[$Colour_Off\] "
fi

export PS2="\[$Cyan\]Secondary->\[$Colour_Off\] "
export PS3="\[$Cyan\]Select option->\[$Colour_Off\] "
export PS4="\[$Cyan\]+xtrace $LINENO->\[$Colour_Off\] "

# Make MAN pages look better, with some color and formatting. 
export LESS_TERMCAP_mb=$'\e[01;31m'
export LESS_TERMCAP_md=$'\e[01;38;5;74m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[38;5;246m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[04;38;5;146m'

alias ls='ls --color=auto'

export HISTCONTROL=ignoreboth
PATH="${PATH}:/home/douwe/bin"
