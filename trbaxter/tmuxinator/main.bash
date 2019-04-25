# NOTE: this will include all of the ozone related scripts, as will as defined some
# required shell variables

# NOTE This assumes you have defined `CUSTOM_SCRIPT_LOCATION` somewhere in your environment
[ -f $CUSTOM_SCRIPT_LOCATION/tmuxinator/create_tmuxinator_service_config.bash ] && source $CUSTOM_SCRIPT_LOCATION/tmuxinator/create_tmuxinator_service_config.bash
