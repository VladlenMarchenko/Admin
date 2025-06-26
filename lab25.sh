#!/bin/bash

declare -A word_count

while IFS= read -r -d $'\0' file; do
    while read -r word; do
        [ -n "$word" ] && ((word_count[$word]++))
    done < <(grep -oh -E '\w+' "$file" | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]')
done < <(find "$1" -type f -name "*.$2" -print0)

for word in "${!word_count[@]}"; do
    printf "%d\t%s\n" "${word_count[$word]}" "$word"
done | sort -nr | head -n "$3" | while read count word; do 
    echo "$word: $count"
done



