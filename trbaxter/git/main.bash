if [ -f $CUSTOM_SCRIPT_LOCATION/git/aliases.bash ]; then
     source $CUSTOM_SCRIPT_LOCATION/git/aliases.bash;
else
	echo "Cannot find: $CUSTOM_SCRIPT_LOCATION/git/aliases.bash";
fi
