export PATH="~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH"

export ARCHFLAGS="-arch x86_64"
export EDITOR="/usr/bin/vim"
export LC_CTYPE=en_AU.UTF-8
export PGHOST=localhost

# Color is good
# http://www.geekology.co.za/blog/2009/04/enabling-bash-terminal-directory-file-color-highlighting-mac-os-x/
export CLICOLOR=1
export LSCOLORS=gxFxCxDxBxegedabagacad

# Window title
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}"; echo -ne "\007"'

#aliases
alias ..="cd .."
alias ...="cd ..; cd .."
alias l="ls -l"
alias la="ls -a"
alias ll="ls -la"
alias m="mate"
alias c="clear"
alias ra="touch tmp/restart.txt"
alias gx="gitx --all"
alias serve="python -m SimpleHTTPServer"
alias gs="git st"
alias pg="pg_ctl -D /usr/local/var/postgres"
alias ss="script/server"
alias mvim="mvim -p"
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias arduino="/Applications/Arduino.app/Contents/MacOS/JavaApplicationStub"
alias ard="/Applications/Arduino.app/Contents/MacOS/JavaApplicationStub"

# My hack of Lachlan's hacked together prompt from:
# http://blogs.atlassian.com/developer/2009/03/gitting-dirty.html
#function parse_git_dirty {
#  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "[*]"
#}
#function parse_git_branch {
#  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
#}
#export PS1='\h \[\033[0;36m\]\w $(git branch &>/dev/null; if [ $? -eq 0 ]; 
#then echo "\[\033[0;33m\]$(parse_git_branch)"; fi) \[\033[0;36m\]\$ \[\033[00m\]'

# Now you don't have to require 'rubygems'
#export RUBYOPT=rubygems

# Fancy GIT bash prompt via https://github.com/magicmonty/bash-git-prompt
   # some other config in .bashrc

   # gitprompt configuration

   # Set config variables first
   GIT_PROMPT_ONLY_IN_REPO=0

   # GIT_PROMPT_SHOW_LAST_COMMAND_INDICATOR=1   # uncomment if you want to show 
                                                # the exit code of the last command 
                                                # in your prompt
   # GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status

   # GIT_PROMPT_START=...    # uncomment for custom prompt start sequence
   # GIT_PROMPT_END=...      # uncomment for custom prompt end sequence

   # as last entry source the gitprompt script
   source ~/.bash-git-prompt/gitprompt.sh

set -o vi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
