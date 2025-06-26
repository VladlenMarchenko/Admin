#!/bin/bash

target_dir="${1:-.}"  

bytes_to_human() {
    local bytes=$1
    local units=('B' 'K' 'M' 'G') 
    local unit=0
    local precision=1
    
    while (($bytes >= 1024 && unit < ${#units[@]} - 1)); do
        bytes=$((bytes / 1024))  
        ((unit++))
    done

    formatted=$(printf "%.${precision}f" "$bytes" | sed -e 's/\.0*$//' -e 's/\(\.[1-9]*\)0*$/\1/')
    echo "${formatted} ${units[$unit]}"
}

find "$target_dir" -type d | while read -r dir; do
    total_bytes=$(find "$dir" -type f -printf "%s\n" | awk '
        BEGIN { sum = 0 }
        { sum += $1 }
        END { print sum }
    ')
    
    human_size=$(bytes_to_human "${total_bytes:-0}")
    echo "${dir}: ${human_size}"
done
