export PROMPT="
%F{green}[%~]%f <`git config user.name`>
=> %# "
RPROMPT='%*'

eval "$(anyenv init -)"
export PATH="$HOME/.anyenv/bin:$PATH"
alias x86="env /usr/bin/arch -x86_64 /bin/zsh --login"

# cd
alias dt="cd ~/Desktop"

# Dockerコマンド
alias d='docker'
alias dc='docker-compose'
alias dcps='docker-compose ps'
alias dcud='docker-compose up -d'
alias dcudb='docker-compose up -d --build'
alias dcd='docker-compose down'

# git
alias g='git'
alias ga='git add'
alias gd='git diff'
alias gs='git status'
alias gp='git push'
alias gb='git branch'
alias gst='git status'
alias gco='git switch'
alias gf='git fetch'
alias gc='git commit'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
