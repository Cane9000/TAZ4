#!/bin/bash

#PLATFORM SCRIPT

#USE DOS2UNIX application to convert config file - removing carriage returns, etc 
dos2unix www-config.txt

#READ CONGIF
. /var/www/html/www-config.txt;

#PLAYLIST GENERATION
ls /media/pi/Cane9000/CameraUploads/*.mov > flist.txt;sed -i s/^/file\ \'/g flist.txt; sed -i  s/.mp4/.mp4\'/g /var/www/html/flist.txt
x=0
>playlist.txt
while [ $x -le $(($LOOP-1)) ]; do cat flist.txt>>playlist.txt; x=$(( $x + 1 ))
done

#STREAMING
ffmpeg     -re -f concat -safe 0 -i playlist.txt -c:v libx264 -preset ultrafast -c:a aac -b 1M -f rtp_mpegts rtp://192.168.1.69:1234


