#!/bin/bash
# Bash script to append mtg photos into a single JPG for Cardmarket


# use exiftool to remove geotags

for D in ./*; do
    if [ -d "$D" ]; then
        cd "$D"
        rm ./output.jpg
        echo "$D"
        exiftool -overwrite_original -m -gps:all= *.JPG
        convert '*.JPG' -auto-orient -resize 25% -rotate '-90>' +append output.jpg
        cd ..
    fi
done



