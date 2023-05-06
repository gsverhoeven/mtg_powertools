#!/bin/bash
# Bash script to append mtg photos into a single JPG for Cardmarket


for D in ./*; do
    if [ -d "$D" ]; then
        cd "$D"
        rm ./output.jpg
        echo "$D"
        convert '*.JPG' -auto-orient -resize 25% -rotate 90> +append output.jpg
        cd ..
    fi
done



