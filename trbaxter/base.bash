export EDITOR=vim

export PATH="/usr/local/bin:$PATH" 
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PS1="\n[\[$(tput sgr0)\]\[\033[38;5;220m\]\t\[$(tput sgr0)\]\[\033[38;5;15m\]] \[$(tput sgr0)\]\[\033[38;5;82m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\n[\[$(tput sgr0)\]\[\033[38;5;200m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;171m\]\H\[$(tput sgr0)\]\[\033[38;5;15m\]]\\$ \[$(tput sgr0)\]"
export GOPATH=$HOME/go


# Personal Plugin Related 
[ -f ~/.trbaxter/fzf.bash ] && source ~/.trbaxter/fzf.bash
[ -f ~/.trbaxter/prettyping.bash ] && source ~/.trbaxter/prettyping.bash
[ -f ~/.trbaxter/htop.bash ] && source ~/.trbaxter/htop.bash
[ -f ~/.trbaxter/misc.bash ] && source ~/.trbaxter/misc.bash

# NOTE: Check on this one
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh


