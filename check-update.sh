#!/bin/bash

updates=$(($(dnf check-update -q | wc -l 2>/dev/null) - 1))
ret=$?

if [ "$ret" -gt 0 ]; then
    output="Updates: - "
elif [ "$updates" -gt 0 ]; then
    output="Updates: $updates "
else
    output="Updates: - "
fi

echo $output

