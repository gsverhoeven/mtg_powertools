#!/bin/bash
# Bash script to append mtg photos into a single JPG for Cardmarket


# use exiftool to remove geotags

OUTFILE="./output.jpg"

for D in ./*; do
    if [ -d "$D" ]; then
        echo "choosing directory $D"
        cd "$D"
        if test -f "$OUTFILE"; then
            echo "removing previous output file"
            rm "$OUTFILE"
        fi
        exiftool -overwrite_original -m -gps:all= *.JPG
        convert '*.JPG' -auto-orient -resize 25% -rotate '-90>' +append output.jpg
        cd ..
    fi
done



