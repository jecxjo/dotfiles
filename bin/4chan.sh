#!/bin/bash
# A bash script for downloading all images in a 4chan thread to their original
# filenames. Updates every 60 seconds until canceled or the thread disappears.
# 
# Copyright 2008, 2010, 2012 Daniel Triendl, Anton Eliasson
# http://blog.pew.cc/blog/4chan+download+script/
# http://antoneliasson.wordpress.com/2010/08/03/4chan-download-script/
# 
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

if [ "$1" = "" ]; then # no arguments
	echo "Usage: `basename $0` <4chan thread url> [optional: download directory]"
	exit 1
fi

if [ "$2" = "" ]; then # only one argument
	LOC=$(echo "$1" | egrep -o '([0-9]*)$' | sed 's/\.html//g' ) # find out the thread number
else
	LOC=$2 # use download dir specified by user
fi
echo "4chan downloader"
echo "Downloading to \"$LOC\" until canceled or 404'd"

if [ ! -d $LOC ]; then
	mkdir -- $LOC
fi

cd -- $LOC # new directory named after the thread number

while [ "1" = "1" ]; do
	thread=`mktemp` # thread is the html thread
	links=`mktemp` # links will be a list of all image addresses
	names=`mktemp` # names will be a list of all original file names

    # get thread
    echo "Updating..."
	wget -q -k -O "$thread" "$1"
	if [ "$?" != "0" ]; then
		echo "Update failed, exiting"
		date
		rm $thread $links $names
		exit 1
	fi

    # get file list, space separated
	grep -E -o 'http://images.4chan.org/[a-z0-9]+/src/([0-9]*).(jpg|png|gif)' "$thread" | uniq | tr "\n" " " > "$links"

	# get original file name list, space separated (spaces in filenames changed to underlines)
	sed 's/ /_/g' "$thread" | grep -E -o '<span_title="[^.]+.(jpg|png|gif)' | awk -F \" '{print $2}' | tr "\n" " " > "$names"

	COUNT=`cat $names | wc -w` # total number of files/names
	for ((i=1; i<=$COUNT; i++)); do
		wget -nv -nc -O `cut -d ' ' -f $i $names` `cut -d ' ' -f $i $links` # now download all files, one by one
	done
	
	rm $thread $links $names
	
	echo "Waiting 60 seconds before next run"
	sleep 60
done;

