#read playlist and rtp stream

. list.txt
x=0
while [ $x -le 20 ]; do ffmpeg -re -i $F4 -c:v libx264 -c:a aac -preset ultrafast -b 2M -t $T -f rtp_mpegts rtp://192.168.1.81:2000; x=$(( $x + 1 ))
. list.txt
done

# dump stream to .ts
rm playout.ts
ffmpeg   -i udp://192.168.1.81:2000  -c:v libx264 -c:a aac -preset ultrafast -b 1.5M playout.ts

# stream .ts buffer

ffmpeg -re -i playout.ts -c:v copy -c:a copy -f rtp_mpegts rtp://192.168.1.69:3000
