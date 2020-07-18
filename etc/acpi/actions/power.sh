#!/bin/sh
# shutdown.

CURRENT_INIT=`ps -p 1 -o comm=`
if [ "$CURRENT_INIT" = "openrc-init" ]
then
	openrc-shutdown -p
else
	shutdown -h now "Power button pressed"
fi
