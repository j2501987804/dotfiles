# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
[ -f /usr/share/autojump/autojump.zsh ] && source /usr/share/autojump/autojump.zsh
[ -f /opt/homebrew/share/autojump/autojump.zsh ] && source /opt/homebrew/share/autojump/autojump.zsh

plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

# Load and initialise completion system
autoload -Uz compinit
compinit

# 别名
alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias v='nvim'
alias k='kubectl'
alias go="go"
alias lg="lazygit"
alias setproxy='export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890'
alias unproxy='unset http_proxy && unset https_proxy && unset all_proxy'

# 环境变量
export PATH=~/go/bin:~/.local/bin:~/.cargo/bin:$PATH
