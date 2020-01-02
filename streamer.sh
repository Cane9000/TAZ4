#!/bin/bash

#PLATFORM SCRIPT

#USE DOS2UNIX application to convert config file - removing carriage returns, etc 
dos2unix www-config.txt

#READ CONGIF
. /var/www/html/www-config.txt;

#PLAYLIST GENERATION
ls /media/pi/Cane9000/video/E*.mp4 -t > flist.txt;sed -i s/^/file\ \'/g flist.txt; sed -i  s/.mp4/.mp4\'/g /var/www/html/flist.txt
x=0
>playlist.txt
while [ $x -le $(($LOOP-1)) ]; do cat flist.txt>>playlist.txt; x=$(( $x + 1 ))
done

F1=rtp://192.168.1.81:1234
F2=rtp://192.168.1.81:5678
F3=rtsp://192.168.1.70:8080/h264_pcm.sdp
F4=/media/pi/Cane9000/video/bbbtest.mp4
#STREAMING
#ffmpeg   -re    -i $F1 -ac 2 -ar 44100 -s $W:$H  -b $BIT -t 00:00:30 -f flv "rtmp://a.rtmp.youtube.com/live2/$KEY" #rtp_mpegts rtp://192.168.1.69:2000 
ffmpeg       -i $F1  -vcodec copy  -acodec copy -ac 2 -ar 44100 -b 1.7M -t 00:00:30  -f rtp_mpegts rtp://192.168.1.81:5000 #flv "rtmp://a.rtmp.youtube.com/live2/$KEY"
ffmpeg       -i $F2  -vcodec copy  -acodec copy -ac 2 -ar 44100 -b 1.7M -t 00:00:30 -f rtp_mpegts rtp://192.168.1.81:5000 
ffmpeg       -i $F1  -vcodec copy  -acodec copy -ac 2 -ar 44100 -b 1.7M -t 00:00:30 -f rtp_mpegts rtp://192.168.1.81:5000 #flv "rtmp://a.rtmp.youtube.com/live2/$KEY"
ffmpeg       -i $F2  -vcodec copy  -acodec copy -ac 2 -ar 44100 -b 1.7M -t 00:00:30 -f rtp_mpegts rtp://192.168.1.81:5000 
ffmpeg       -i $F1  -vcodec copy  -acodec copy -ac 2 -ar 44100 -b 1.7M -t 00:00:30 -f rtp_mpegts rtp://192.168.1.81:5000 #flv "rtmp://a.rtmp.youtube.com/live2/$KEY"
ffmpeg       -i $F2  -vcodec copy  -acodec copy -ac 2 -ar 44100 -b 1.7M -t 00:00:30 -f rtp_mpegts rtp://192.168.1.81:5000 
ffmpeg       -i $F1  -vcodec copy  -acodec copy -ac 2 -ar 44100 -b 1.7M -t 00:00:30 -f rtp_mpegts rtp://192.168.1.81:5000 #flv "rtmp://a.rtmp.youtube.com/live2/$KEY"
ffmpeg       -i $F2  -vcodec copy  -acodec copy -ac 2 -ar 44100 -b 1.7M -t 00:00:30 -f rtp_mpegts rtp://192.168.1.81:5000 
ffmpeg       -i $F1  -vcodec copy  -acodec copy -ac 2 -ar 44100 -b 1.7M -t 00:00:30  -f rtp_mpegts rtp://192.168.1.81:5000 #flv "rtmp://a.rtmp.youtube.com/live2/$KEY"
ffmpeg       -i $F2  -vcodec copy  -acodec copy -ac 2 -ar 44100 -b 1.7M -t 00:00:30 -f rtp_mpegts rtp://192.168.1.81:5000 
ffmpeg       -i $F1  -vcodec copy  -acodec copy -ac 2 -ar 44100 -b 1.7M -t 00:00:30 -f rtp_mpegts rtp://192.168.1.81:5000 #flv "rtmp://a.rtmp.youtube.com/live2/$KEY"
ffmpeg       -i $F2  -vcodec copy  -acodec copy -ac 2 -ar 44100 -b 1.7M -t 00:00:30 -f rtp_mpegts rtp://192.168.1.81:5000 
ffmpeg       -i $F1  -vcodec copy  -acodec copy -ac 2 -ar 44100 -b 1.7M -t 00:00:30 -f rtp_mpegts rtp://192.168.1.81:5000 #flv "rtmp://a.rtmp.youtube.com/live2/$KEY"
ffmpeg       -i $F2  -vcodec copy  -acodec copy -ac 2 -ar 44100 -b 1.7M -t 00:00:30 -f rtp_mpegts rtp://192.168.1.81:5000 
ffmpeg       -i $F1  -vcodec copy  -acodec copy -ac 2 -ar 44100 -b 1.7M -t 00:00:30 -f rtp_mpegts rtp://192.168.1.81:5000 #flv "rtmp://a.rtmp.youtube.com/live2/$KEY"

#ffmpeg       -use_wallclock_as_timestamps 1 -i $F2  -vcodec copy  -acodec copy -ac 2 -ar 44100 -b 1.7M -t 00:00:30 -f rtp_mpegts rtp://192.168.1.81:5000 

#ffmpeg       -i $F3 -ac 2 -ar 44100 -t 00:00:30 -f flv "rtmp://a.rtmp.youtube.com/live2/$KEY" #rtp_mpegts rtp://192.168.1.69:2000 
#ffmpeg       -i $F2 -ac 2 -ar 44100 -t 00:00:30 -f flv "rtmp://a.rtmp.youtube.com/live2/$KEY" #rtp_mpegts rtp://192.168.1.69:2000 
#ffmpeg       -i $F3 -ac 2 -ar 44100 -t 00:00:30 -f flv "rtmp://a.rtmp.youtube.com/live2/$KEY" #rtp_mpegts rtp://192.168.1.69:2000 
#ffmpeg       -i $F3 -ac 2 -ar 44100 -t 00:00:30 -f flv "rtmp://a.rtmp.youtube.com/live2/$KEY" #rtp_mpegts rtp://192.168.1.69:2000 
#ffmpeg       -i $F2 -ac 2 -ar 44100 -t 00:00:30 -f flv "rtmp://a.rtmp.youtube.com/live2/$KEY" #rtp_mpegts rtp://192.168.1.69:2000 
#ffmpeg       -i $F3 -ac 2 -ar 44100 -t 00:00:30 -f flv "rtmp://a.rtmp.youtube.com/live2/$KEY" #rtp_mpegts rtp://192.168.1.69:2000 
#ffmpeg       -i $F2 -ac 2 -ar 44100 -t 00:00:30 -f flv "rtmp://a.rtmp.youtube.com/live2/$KEY" #rtp_mpegts rtp://192.168.1.69:2000 
#ffmpeg       -i $F3 -ac 2 -ar 44100 -t 00:00:30 -f flv "rtmp://a.rtmp.youtube.com/live2/$KEY" #rtp_mpegts rtp://192.168.1.69:2000 
