#!/bin/sh

SINK=`pacmd list-sinks | grep -B 4 RUNNING | grep index | awk ' { print $NF } '`
pactl set-sink-volume $SINK $1

