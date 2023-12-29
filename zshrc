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
alias k='kubectl'
alias lg="lazygit"
alias gc="git clone "
alias setproxy='export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890'
alias unproxy='unset http_proxy && unset https_proxy && unset all_proxy'

# 环境变量
export PATH=/usr/local/go/bin:~/go/bin:~/.local/bin:~/.cargo/bin:/home/kk/.dotnet:$PATH
export EDITOR=nvim

