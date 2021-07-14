# This runs on each login

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Vim Keys
set -o vi

# Bash Git Prompt - https://github.com/magicmonty/bash-git-prompt
GIT_PROMPT_ONLY_IN_REPO=0

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

# For bash-completion - brew install bash_completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Colour
export CLICOLOR=1
#export HOMEBREW_GITHUB_API_TOKEN=

# Set tmux pane title on SSH connections
# http://blog.no-panic.at/2015/04/21/set-tmux-pane-title-on-ssh-connections/
ssh() {
  if [ "$(ps -p $(ps -p $$ -o ppid=) -o comm=)" = "tmux" ]; then
    tmux rename-window "$(echo $* | cut -d . -f 1)"
    command ssh "$@"
    tmux set-window-option automatic-rename "on" 1>/dev/null
  else
    command ssh "$@"
  fi
}

eval "$(rbenv init -)"
