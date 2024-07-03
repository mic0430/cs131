#!/bin/bash

# Display usage information
usage() {
    echo "Usage: a2shellscript.sh [option] [arguments]"
    echo "Options:"
    echo "  -l [file]                  Count the lines in the file."
    echo "  -s [file]                  File (word count, line count, character count,number count)."
    echo "  -a [file]                  Count the number in the file."
    echo "  -p [file]                  Print the contents of the file."
    exit 1
}

if [ $# -lt 1 ]; then
    usage
fi

# Parse the option and perform the corresponding action
case $1 in
    -l)#Count the number of lines in the file
    #accept a file (will give 1 if not file is not found), use echo and wc command to count
    #how many lines in there
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
    
    #combines the other two commands with 2 extra commands to summarize a file
    # it will acept a file, then use the echo and wc commands to print out the information
    # of the file, it includes word count, line count, character count, and number count.
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
    #Count the digitals in a file
    #similar to -i, it accepts a file, use the eho and grep -o '[0-9]' command to 
    #count how many digitals are there 
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
    # print out the content of the file
    -p)
        if [ -z "$2" ]; then
            echo "Please provide a file."
            usage
        fi
        file=$2
        if [ ! -f "$file" ]; then
            echo "File not found!"
            exit 1
        fi
        echo "Contents of $file:"
        cat "$file"
        ;;
    *)
        usage
        ;;	    
esac

exit 0

