#!/bin/sh

SINK=`pacmd list-sinks | grep -B 4 RUNNING | grep index | awk ' { print $NF } '`

if [ -z "$SINK" ]
then 
    echo "-"
else
    echo `/home/betcke/.local/bin/pamixer --sink $SINK --get-volume-human`
fi


