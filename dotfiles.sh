#!/usr/bin/env bash

# Parse given arguments
while [[ $# -gt 0 ]];  do
    case $1 in
        -f | --file) file="$2" ;;
        -t | --tag) tag="$2" ;;
        -h | --help)
            echo "Usage:"
            echo "    dotfiles.sh --help                            Display this help message."
            echo "    dotfiles.sh --tag <tag> --file <file>         Install dotfiles under <tag> in <file>."
            exit 0 ;;
    esac
shift
done

# Check given file exists
if [[ ! -f "$file" ]];  then
    tput setaf 1; # 1 - red
    echo "Error: File not found: '$file'."
    tput sgr0 # reset
    exit 1
fi

echo "Parsing '$file' for entries under '$tag'."

while read line || [[ -n "$line" ]];  do

    # For each line in the given file:
    # 1. Squeeze multiple space into one.
    # 2. Cut into several fields using space as the delimeter.
    # 3. If the tag matches the given tag, create the symbolic link.

    currTag=$(echo "$line" | tr -s " " | cut -d " " -f 1)

    if [[ "$currTag" == "$tag" ]];  then
        target=$(echo "$line" | tr -s " " | cut -d " " -f 2)
        link=$(echo "$line" | tr -s " " | cut -d " " -f 3)

        # Check target exists
        if [[ ! -f "$target" ]];  then
            tput setaf 1; # 1 - red
            echo "Error: Target not found: '$target'."
            tput sgr0 # reset
            exit 2
        fi

        echo "Creating symbolic link '$link' to '$target'."

        # Alert user that existing file will be overwritten
        if [[ -e "$link" ]];  then
            tput setaf 3 # 3 - yellow
            echo "File '$link' already exists. Overwriting..."
            tput sgr0 # reset
        fi

        # Forcibly create the symbolic link
        ln -sf $target $link
    fi
done < "$file"

echo "All done."
