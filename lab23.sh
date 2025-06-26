#!/bin/bash
target_dir="${1:-.}"
mkdir -p "${target_dir}/no_extension"

find "$target_dir" -maxdepth 1 -type f -print0 | while IFS= read -r -d $'\0' file; do
    filename=$(basename "$file")
    extension="${filename##*.}"
    
    if [[ "$filename" == "$extension" ]]; then
        category="no_extension"
    else
        category="$extension"
    fi

    mkdir -p "${target_dir}/${category}"
    mv -v "$file" "${target_dir}/${category}/"
done

echo "Sorting complete!"
