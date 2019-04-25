 # Git
 alias gc='git commit'

 ## if you want to commit without running the `make prepare` git hook
 alias gcv='git commit --no-verify'

 alias gstatus='git status';

gcam () {
	git commit -am "$1"
}
