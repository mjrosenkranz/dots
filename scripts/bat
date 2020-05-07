#!/usr/bin/env bash
bat0="$(cat /sys/class/power_supply/BAT0/capacity)"
bat1="$(cat /sys/class/power_supply/BAT1/capacity)"
stat0="$(cat /sys/class/power_supply/BAT0/status)"
stat1="$(cat /sys/class/power_supply/BAT1/status)"

if [[ $1 == "single" ]]; then
	if [[ "$stat0" == "Charging" || "$stat1" == "Charging" ]]; then
		echo "%{u$(clrmgr -x color2)}$(((bat0 + bat1) / 2))%"
	else 
		echo "$(((bat0 + bat1) / 2))%"
	fi
else
	if [[ "$stat0" == "Charging" || "$stat1" == "Charging" ]]; then
		echo "%{u$(clrmgr -x color2)}$bat0% $bat1%"
	else 
		echo "$bat0% $bat1%"
	fi

fi

