alias lgit='cd ~/git/'
newb () {
	$2;
	git checkout -b $1;
	git branch;
}

gdev () {
	git checkout dev && git pull;
	git branch;
}

gmas () {
	git checkout master && git pull;
	git branch;
}

