# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "rupa/z"

# Load and initialise completion system
autoload -Uz compinit
compinit

# 别名
alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias v='nvim'
alias vf='nvim $(fzf)'
alias k='kubectl'
alias lg="lazygit"
alias gc="git clone "
alias setproxy='export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890'
alias unproxy='unset http_proxy && unset https_proxy && unset all_proxy'
alias linkredis='ssh -L 6379:localhost:6379 root@13.234.102.111'
# 环境变量
export PATH=$PATH:/Applications/GoLand.app/Contents/MacOS:~/sdk/go1.23.4/bin:/usr/local/go/bin:~/go/bin:~/.local/bin:~/.cargo/bin
export EDITOR=nvim
setproxy
# eval "$(pdm --pep582)"
