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
				newb C8-$ticket;
			fi
		done
	fi
}
