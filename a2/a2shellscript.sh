#!/bin/bash

# Display usage information
usage() {
    echo "Usage: a2shell.sh [option] [arguments]"
    echo "Options:"
    echo "  -l [file]                  Count the lines in the file."
    echo "  -s [file]                  File (word count, line count, character count,number count)."
    echo "  -a [file]                  Count the number in the file."
    exit 1
}
# Check if at least one argument is provided
if [ $# -lt 1 ]; then
    usage
fi

# Parse the option and perform the corresponding action
case $1 in
    -l)
        if [ -z "$2" ]; then
            echo "Please provide a file."
            usage
        fi
        file=$2
        if [ ! -f "$file" ]; then
            echo "File not found!"
            exit 1
        fi
        echo "Number of lines in $file:"
        wc -l < "$file"
        ;;

    -s)
        if [ -z "$2" ]; then
            echo "Please provide a file."
            usage
        fi
        file=$2
        if [ ! -f "$file" ]; then
            echo "File not found!"
            exit 1
        fi
        echo "Summary of $file:"
        echo "Word count:"
        wc -w < "$file"
        echo "Line count:"
        wc -l < "$file"
        echo "Character count:"
        wc -m < "$file" | awk '{print $1 - 1}'
        echo "Number  count:"
        grep -o '[0-9]' "$file" | wc -l
        ;;
    -a)
        if [ -z "$2" ]; then
            echo "Please provide a file."
            usage
        fi
        file=$2
        if [ ! -f "$file" ]; then
            echo "File not found!"
            exit 1
        fi
        echo "Number count  in $file:"
        grep -o '[0-9]' "$file" | wc -l
        ;;
    *)
        usage
        ;;	    
esac

exit 0

