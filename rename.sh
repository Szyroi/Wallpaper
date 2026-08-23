#!/bin/bash

path="$HOME/Pictures/P/WP"

mkdir -p -v "$path" && cd "$path" || exit

i=1

for file in *; do
    if [ -f "$file" ] && [ "$file" != "rename.sh" ]; then

        if [[ "$file" =~ ^[0-9]+\.[^.]+$ ]]; then
            continue
        fi

        if [[ "$file" == *.* ]]; then
            extension="${file##*.}"
        else
            extension=""
        fi

        while compgen -G "${i}.*" >/dev/null || [ -e "$i" ]; do
            ((i++))
        done

        new_name="${i}.${extension}"
        mv -- "$file" "$new_name"
        echo "Renamed: $file -> $new_name"

        ((i++))
    fi
done

echo "DONE!!!"
