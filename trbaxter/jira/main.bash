# This will create a new new branch based on JIRA ticket name and start
# time tracking as well as a few other actions

# NOTE: This has the following dependencies to hebave correctly:
# 	https://github.com/Netflix-Skunkworks/go-jira
# 	https://github.com/sachaos/toggl
#	https://github.com/vishwanatharondekar/gitlab-cli

gira () {
	ticket=$1;
	actions=$2;

	if [ -z "$actions" ]; then
		git checkout C8-$ticket;
		toggl start C8-$ticket;
	else
		actions=`getopt egort $2`;
		for action in $actions
		do
			if [ $action == '-b' ] ; then
				git checkout dev;
				git pull;
				git checkout -b C8-$ticket;
			fi
		done
	fi
}

start_ticket () {
	ticket=$1;

	DATE=`date '+%Y-%m-%d %H:%M:%S'`;
	newb $ticket gdev;
	FILE=$WEB_BASE/CHANGELOG.md
	sed "8 i\\
	- [$ticket] - Starting work on $ticket (Date: $DATE)
	" $FILE > $FILE.temp
	mv $FILE.temp $FILE

	git commit $WEB_BASE/CHANGELOG.md -m "[$ticket] Initial Commit for $ticket (Date: $DATE)";
	git push --set-upstream origin $ticket;
	jira transition "Start Progress" $ticket;
	toggl start $ticket;

}

resume_ticket () {
	ticket=$1;

	git checkout $ticket;
	git pull;
	jira transition "Start Progress" $ticket
	toggl start $ticket;
}

wip_stop_ticket () {
	ticket=$1

	DATE=`date '+%Y-%m-%d %H:%M:%S'`
	git commit $WEB_BASE/. -am "[$ticket] WIP Stopping work on $ticket (Date: $date)"
	git push
	toggl stop $ticket;
	jira transition "Stop Progress" $ticket;

}

complete_ticket () {
	ticket=$1

	echo "Running all tests... Go grab a coffee...";
	cd $WEB_BASE;
	yarn test

	echo "Proceed? (y/n)"
	read proceed;
	if [ $proceed == 'n' ]; then
		exit;
	fi

	echo "CHANGELOG Message (External Facing):"
	read changelog_message;

	echo "Add CHANGELOG to aurora-web-forestry? (y/n)"
	read forestry_changelog

	echo "Add CHANGELOG to aurora-web-disney? (y/n)"
	read disney_changelog

	echo "Git Commit Message (Internal Facing):"
	read commit_message;


	echo "Adding CHANGELOG Message to: $WEB_BASE/CHANGELOG.md"
	BASE_FILE=$WEB_BASE/CHANGELOG.md



	sed "8 i\\
	- [$ticket] - $changelog_message
	" $BASE_FILE > $BASE_FILE.temp
	mv $BASE_FILE.temp $BASE_FILE

	git commit $WEB_BASE/. -am "[$ticket] Submitting For Review: $commit_message (Date: $date)"
	git push;

	toggl stop $ticket;
	jira transition "Merge Request" $ticket
	lab merge-request -t $ticket -r true


}
