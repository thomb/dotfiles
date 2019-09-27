# Git
alias gc='git commit'

## if you want to commit without running the `make prepare` git hook
alias gcv='git commit --no-verify'

alias gstatus='git status';
alias gitst='git status';
alias gmas='git checkout master; git pull';

gcam () {
	git commit -am "$1"
}

gdel () {
    git branch -d $1
}

gfdel () {
    git branch -D $1
}
