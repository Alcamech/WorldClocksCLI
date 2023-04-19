#!/bin/bash

function display_time() {
    timezone_name="$1"
    hour=$(TZ="$timezone_name" date +"%-H")
    minute=$(TZ="$timezone_name" date +"%-M")

    if (( hour >= 5 && hour < 12 )); then
        time_of_day="MORNING"
    elif (( hour >= 12 && hour < 18 )); then
        time_of_day="DAYTIME"
    elif (( hour >= 18 && hour < 22 )); then
        time_of_day="EVENING"
    else
        time_of_day="NIGHTTIME"
    fi

    echo "Time in $timezone_name:"
    echo ""
    echo "       $time_of_day       "
    echo ""
    printf "    %6d:%02d\n" $hour $minute
    echo ""
}

function list_timezones() {
    zones=( $(find /usr/share/zoneinfo -type f | sed 's|/usr/share/zoneinfo/||' | sort) )
    
    echo "Select timezones from the list below (separated by spaces):"
    for i in "${!zones[@]}"; do
        printf "[%3d] %s\n" $((i+1)) "${zones[i]}"
    done
    
    read -p "Enter the numbers of the timezones you want to display, separated by spaces: " -a choices
    
    selected_zones=()
    for choice in "${choices[@]}"; do
        choice=$((choice-1))
        if [ $choice -ge 0 ] && [ $choice -lt ${#zones[@]} ]; then
            selected_zones+=("${zones[$choice]}")
        else
            echo "Invalid selection: $((choice+1))"
        fi
    done
    
    for tz_name in "${selected_zones[@]}"; do
        display_time "$tz_name"
    done
}

function display_help() {
    echo "Usage: $0 [options] [timezone1 timezone2 ...]"
    echo "Options:"
    echo "  -h, --help       Show this help message and exit"
    echo "  -l, --list       List all available timezones and select one"
    echo ""
    echo "Example: $0 America/New_York Asia/Tokyo"
    echo "Example (list timezones): $0 -l"
}

if [[ "$#" -eq 0 || "$1" == "-h" || "$1" == "--help" ]]; then
    display_help
    exit 0
fi

if [[ "$1" == "-l" || "$1" == "--list" ]]; then
    list_timezones
    exit 0
fi

for tz_name in "$@"
do
    display_time "$tz_name"
done
