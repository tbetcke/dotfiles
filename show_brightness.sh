#!/bin/sh

BRIGHTNESS=`light | awk '{printf "%.0f", $1}'`
echo "${BRIGHTNESS}%"

