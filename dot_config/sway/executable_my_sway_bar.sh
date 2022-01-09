#!/bin/bash

current_time=$(date +'%H:%M:%S')
battery_percentage=$(upower --show-info /org/freedesktop/UPower/devices/battery_BAT0 | egrep "percentage" | awk '{print $2}')
battery_life=$(upower --show-info $(upower --enumerate | grep BAT) | egrep "time to empty" | awk '{print $4}')
battery_status=$(upower --show-info $(upower --enumerate | grep 'BAT') | egrep "state" | awk '{print $2}')

if [ $battery_status = "discharging" ];
then
    battery_pluggedin='⚠'
else
    battery_pluggedin='⚡'
fi

volume=$(pactl list sinks | grep "Volume: front-left" | awk '{print $5}')

echo $volume $battery_pluggedin $battery_percentage $battery_life h - $current_time
