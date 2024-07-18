#!/bin/bash
#
# creates a file on the Desktop named todo.md and opens it with nvim.
# if the file already exists and the date matches $now, it opens the file.
# otherwise, replaces old date header with $now date header,
# leaving the rest of the file's contents.
#

filename=todo
path=$HOME/Desktop/
now=$(date "+%Y-%m-%d")

# if called with "did", move todo to trash if it exists
if [ -n "$1" ] && [ "$1" = "did" ]; then
    if [[ -f "$path$filename.md" || -L "$path$filename.md" ]]; then
        trash "$path$filename.md"
    fi
# if called with "ref", open the reference named md-example.md
elif [ -n "$1" ] && [ "$1" = "ref" ]; then
    RFP="$(realpath "$0" | xargs dirname)"
    nvim "$RFP/md-example.md"
    # nvim "/Users/stephenlanier/Documents/Code/scripts/todo/md-example.md"
# else create or modify todo file if necessary and then open
else
    # if file already exists
    if [[ -f "$path$filename.md" || -L "$path$filename.md" ]]; then
        # get first line of file
        # firstline=$(cat "$path$filename.md" | sed -E 's/# ([0-9]{4}.[0-9]{2}.[0-9]{2})/\1/')
        firstline=$(sed -E 's/# ([0-9]{4}.[0-9]{2}.[0-9]{2})/\1/' <"$path$filename.md")
        # if date doesn't match $now
        if [ "$now" != "$firstline" ]; then
            # replace `# yyyy-mm-dd` with `# $now`
            # sed -Ei '' "s/# [0-9]{4}.[0-9]{2}.[0-9]{2}/# $now/" "$path$filename.md"
            echo -e "# $now\n$(tail -n +2 "$path$filename.md")" >"$path$filename.md"
        fi
    # else just touch new file
    else
        echo "# $now" >"$path$filename.md"
    fi
    nvim "$path$filename.md"
fi
