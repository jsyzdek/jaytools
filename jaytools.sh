#
# Just some standard things Jay likes to use.
#

# some more ls aliases
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias gitk="gitk.exe"
alias pls="sudo"
alias please="sudo"
alias terminus=/mnt/c/Users/jaysy/vendor/bin/terminus
alias explorer="explorer.exe ."
alias gitr='git reset --hard && git ls-files --others --exclude-standard | xargs rm'

# development dir aliases
alias cda='cd /mnt/c/Users/jaysy/AndroidStudioProjects/app-mobile-android'
alias cdv='cd /mnt/c/Users/jaysy/PhpstormProjects/voiceaxis'

function gitl () {
  NUMBER="${1-15}"  
  git log -n $NUMBER --pretty=format:"%C(yellow)%h %C(auto,magenta)%>(12)%ad %Cgreen%<(7)%aN%Cred%d %Creset%s"
}

unset MAILCHECK
export HISTTIMEFORMAT="%F %T %t "

##########################################################
#                                                        #
# Sexy Bash Prompt, inspired by "Extravagant Zsh Prompt" #
# Screenshot: http://cloud.gf3.ca/M5rG                   #
# A big thanks to \amethyst on Freenode                  #
#                                                        #
##########################################################
#
# Default setting
#
if tput setaf 1 &> /dev/null; then
    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
      MAGENTA=$(tput setaf 9)
      ORANGE=$(tput setaf 172)
      GREEN=$(tput setaf 190)
      PURPLE=$(tput setaf 141)
      WHITE=$(tput setaf 0)
    else
      MAGENTA=$(tput setaf 5)
      ORANGE=$(tput setaf 4)
      GREEN=$(tput setaf 2)
      PURPLE=$(tput setaf 1)
$
    fi
    BOLD=$(tput bold)
    RESET=$(tput sgr0)
else
    MAGENTA="\033[1;31m"
    ORANGE="\033[1;33m"
    GREEN="\033[1;32m"
    PURPLE="\033[1;35m"
    WHITE="\033[1;37m"
    BOLD=""
    RESET="\033[m"
fi

parse_git_dirty () {
  [[ $(git status 2> /dev/null | tail -n1 | cut -c 1-17) != "nothing to commit" ]] && echo "*"
}
parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

export PS1="\n\[\e[1;31m\]local \[\e[1;37m\]in \[\e[38;5;026m\]\w\[$WHITE\]\[$PURPLE\]\\[$WHITE\] \[\033[1;30m\]\$(date +'%Y-%m-%d %H:%M:%S')\n\$ \[$RESET\]"


