if status is-interactive
    # Commands to run in interactive sessions can go here
# alias
alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias v='nvim'
alias k='kubectl'
alias go="go"
alias lg="lazygit"
alias setproxy='export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890'
alias unproxy='unset http_proxy && unset https_proxy && unset all_proxy'

# 环境变量
export EDITOR='nvim'
export HOMEBREW_NO_AUTO_UPDATE=true #关闭brew自动更新
set -x PATH ~/go/bin ~/.local/bin /opt/homebrew/bin $PATH
end
