#!/usr/bin/env bash

create_tmuxinator_service_config () {
	if [ $# -lt 2 ]
	then
			echo "Usage: create_tmuxinator_service_config <config_name> <service_list, >"
			return
	fi

	fileName=$1
	echo "Creating $fileName.yml"
	panes=""
	COUNT="0"
	for var in "$@"; do
		echo "arg count $COUNT"
		if [ "$COUNT" -gt "0" ]; then
			echo "Adding pane for $var"
			if ["$COUNT" -e "1"]; then
				panes="  - cd $OZONE_SERVICE_PATH/$var/$var && make && ./$var server run -c $LOCAL_OZONE_SERVICE_LOCATION/local_$var.toml";
			else
				panes="$panes
        - cd $OZONE_SERVICE_PATH/$var/$var && make && ./$var server run -c $LOCAL_OZONE_SERVICE_LOCATION/local_$var.toml";
			fi

		fi
		let COUNT++
	done

	echo "created panes: $panes"

	cat >$TMUXINATOR_CONFIG_LOCATION/$fileName.yml << EOL
name: $fileName
root: ./~
attach: false
windows:
  - $fileName:
      layout: even-horizontal
      panes:
      $panes


EOL

	echo "Execute new Config Immediately? (y/n)?"
	read execute;
	if [ $execute == 'y' ]; then
		mux start $fileName
	fi



}
