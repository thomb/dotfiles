export EDITOR=vim

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}


export PATH="/usr/local/bin:$PATH" 
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PS1='\n[\[$(tput sgr0)\]\[\033[38;5;220m\]\D{%F %T}$(tput sgr0)\]\[\033[38;5;15m\]] $(parse_git_branch) $(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]\n[\[$(tput sgr0)\]\[\033[38;5;200m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;171m\]\H\[$(tput sgr0)\]\[\033[38;5;15m\]:\[\033[38;5;82m\]\w\[$(tput sgr0)\]]\\$ '
export GOPATH=$HOME/go


# Personal Plugin Related 
[ -f ~/.trbaxter/fzf.bash ] && source ~/.trbaxter/fzf.bash
[ -f ~/.trbaxter/prettyping.bash ] && source ~/.trbaxter/prettyping.bash
[ -f ~/.trbaxter/htop.bash ] && source ~/.trbaxter/htop.bash
[ -f ~/.trbaxter/misc.bash ] && source ~/.trbaxter/misc.bash
