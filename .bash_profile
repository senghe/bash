# Bash prompt
update_terminal_cwd () { 
    local SEARCH=' ';
    local REPLACE='%20';
    local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}";
    printf '\e]7;%s\a' "$PWD_URL"
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\[\033[00m\]\u\[\033[33m\] \w \[\033[32m\]$(parse_git_branch)\[\033[00m\] \[\033[00m\]"
PROMPT_COMMAND="update_terminal_cwd;source /Users/senghe/.bash_profile;"

# Git tab completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Helpers & tricks
alias clearall="clear; clear; clear;"
alias reload-bash="source ~/.bash_profile"
alias open-instance="open -n -a"

alias desktop-icons-hide="defaults write com.apple.finder CreateDesktop false && killall Finder"
alias desktop-icons-show="defaults write com.apple.finder CreateDesktop true && killall Finder"
alias single-app-mode-on="defaults write com.apple.dock single-app -bool true; killall Dock"
alias single-app-mode-off="defaults write com.apple.dock single-app -bool false; killall Dock"
