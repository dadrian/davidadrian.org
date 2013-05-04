#!/bin/bash
#
# A script to launch the node app. 
#
# Essentially, this sets the mandatory environment variables. It does not set things
# that could have different values based on whether or not this was a development or
# production environment.
#

if [ ! $NODE_LAUNCH_SCRIPT ]; then
	export NODE_LAUNCH_SCRIPT="server.js"
fi

if [ ! -f "$NODE_LAUNCH_SCRIPT" ]; then
    echo "Launch script: '$NODE_LAUNCH_SCRIPT' could not be located. Aborting..."
    exit
fi

if [ ! $NODE_ENV ]; then
    export NODE_ENV=production
fi

export CONFIG_app_rootdir="$PWD"
NCMD="node $NODE_LAUNCH_SCRIPT"
echo "--------------------- INFO ---------------------"
echo "Running $NODE_LAUNCH_SCRIPT with app.rootdir = $CONFIG_app_rootdir"
echo "--------------------- ---- ---------------------"


$NCMD