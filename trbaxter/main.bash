#!/usr/bin/env bash

# This will include _all_ of the scripts in this folder, this is provided for convenience
# but more often than not you will probably find yourself wanting to include only
# certain scripts, so ... you've been warned

export CUSTOM_SCRIPT_LOCATION="$HOME/.trbaxter"
export TMUXINATOR_CONFIG_LOCATION="$HOME/.trbaxter/tmuxinator"
export WEB_BASE="$HOME/trbaxter"
export DOTFILES_LOCATION="$LOCAL_GITHUB/dotfiles"


# Include all of the react  related scripts
if [ -f $CUSTOM_SCRIPT_LOCATION/react/main.bash ]; then
	source $CUSTOM_SCRIPT_LOCATION/react/main.bash;
else
	echo "Cannot find: $CUSTOM_SCRIPT_LOCATION/react/main.bash";
fi

# Include all of the jira related scripts
if [ -f $CUSTOM_SCRIPT_LOCATION/jira/main.bash ]; then
	source $CUSTOM_SCRIPT_LOCATION/jira/main.bash;
else
	echo "Cannot find: $CUSTOM_SCRIPT_LOCATION/jira/main.bash";
fi

# Include all of the docker related scripts
if [ -f $CUSTOM_SCRIPT_LOCATION/docker/main.bash ]; then
	source $CUSTOM_SCRIPT_LOCATION/docker/main.bash;
else
	echo "Cannot find: $CUSTOM_SCRIPT_LOCATION/docker/main.bash";
fi

# Include all of the git related scripts
if [ -f $CUSTOM_SCRIPT_LOCATION/git/main.bash ]; then
	source $CUSTOM_SCRIPT_LOCATION/git/main.bash;
else
	echo "Cannot find: $CUSTOM_SCRIPT_LOCATION/git/main.bash";
fi

# Include all of the git related scripts
if [ -f $CUSTOM_SCRIPT_LOCATION/tmuxinator/main.bash ]; then
	source $CUSTOM_SCRIPT_LOCATION/tmuxinator/main.bash;
else
	echo "Cannot find: $CUSTOM_SCRIPT_LOCATION/tmuxinator/main.bash";
fi


# Include all of the git related scripts
if [ -f $CUSTOM_SCRIPT_LOCATION/utils.bash ]; then
	source $CUSTOM_SCRIPT_LOCATION/utils.bash;
else
	echo "Cannot find: $CUSTOM_SCRIPT_LOCATION/utils.bash";
fi
