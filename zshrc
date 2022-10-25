# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zinit
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# completion
zinit wait lucid atload"zicompinit; zicdreplay" blockf for \
    zsh-users/zsh-completions

# autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh

# Plugin history-search-multi-word loaded with investigating.
zinit load zdharma-continuum/history-search-multi-word

# Two regular plugins loaded without investigating.
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

# Load powerlevel10k theme
zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k
### End of Zinit's installer chunk

# alias
alias r='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias v='nvim'
alias k='kubectl'
alias go="go"
alias lg="lazygit"
export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
alias unproxy='unset http_proxy && unset https_proxy && unset all_proxy'

# 环境变量
export EDITOR='nvim'
export HOMEBREW_NO_AUTO_UPDATE=true #关闭brew自动更新
export PATH=$PATH:~/go/bin

# 公司配置
export GOPRIVATE=*.91160.com,*.github.com
export GO_RUNMODE=dev #160开发环境配置变量
setopt no_nomatch
