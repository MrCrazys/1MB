#!/usr/bin/env bash

# @Filename: 1MB-mplcheck.sh
# @Version: 1.0, build 002
# @Release: October 15th, 2021
# @Description: Helps us check for infected Minecraft plugin/server jar files.
# @Description: Note that this is for a specific malicious type and nothing more.
# @Contact: I am @floris on Twitter, and mrfloris in MineCraft.
# @Discord: floris#0233 on https://discord.gg/floris
# @Install: chmod a+x 1MB-mplcheck.sh
# @Syntax: ./1MB-mplcheck.sh
# @URL: Latest source, wiki, & support: https://scripts.1moreblock.com/

### CONFIGURATION
#
# Declarations here you can customize to your preferred setup.
# Generally only if you actually have to.
#
###

# plugins directory
jardir="./plugins"

# type to scan
jarfiles="*.jar"

# unique string to search for
searchString=".l_ignore"


### FUNCTIONS AND CODE
#
# ! WE ARE DONE, STOP EDITING BEYOND THIS POINT !
#
###

# starting
echo -e "\\nChecking...\\n"

# going through all the files
for filename in $jardir/$jarfiles
do
    # debug - what file are we processing now
    echo -e "File: $filename"

    # grep can work, jars are just zip files
    # lets go find out if the header has unique string in it
    zgrep -i "$searchString" "$filename"
done

# infected jars make a hidden dot file, can we find it in that plugins directory?
if [ -f "$jardir/$searchString" ]; then
    # file exists
    echo -e "\\nOops, I also found $jardir/$searchString - maybe you're infected...\\n"
else
    # file was not found
    echo -e "\\nI also checked for $jardir/$searchString but did not find it (that is good) ...\\n"
fi

# and we are done, stopping
echo -e "\\nDone checking... (If the list has entries with 'Binary file matches', then you are in trouble.\\n"


#EOF Copyright (c) 2011-2021 - Floris Fiedeldij Dop - https://scripts.1moreblock.com