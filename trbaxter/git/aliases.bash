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

newb () {
	ticket=$1;
    if [ -z $1 ]; then
        echo "Please provide a ticket number"
        read ticket
    fi

    echo "bug or task?"
    read branch;
    if [ $branch == "bug" ]; then
        bugbranch $ticket
    else
        taskbranch $ticket
    fi
}

bugbranch () {
	echo "Describe what you are fixing:"
	read commitMessage;
	commitMessage=${commitMessage// /-}
    git checkout master;
    git checkout -b bugfix-thomas-$1-$commitMessage
}


taskbranch () {
	echo "Describe what you are working on:"
	read commitMessage;
	commitMessage=${commitMessage// /-}
    git checkout master;
    git checkout -b task-thomas-$1-$commitMessage
}


