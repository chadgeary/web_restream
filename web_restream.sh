#!/bin/bash
INPUT_URL_FILE=/var/spool/web_restream.input
YOUTUBE_URL=$(head -n 1 $INPUT_URL_FILE)
if [ -z $YOUTUBE_URL ]
then
  echo "missing $INPUT_URL_FILE URL"
  exit 1
fi

# clear web spool
rm -f /var/www/html/stream.m3u8
/usr/local/bin/youtube-dl --rm-cache-dir

# begin stream
/usr/local/bin/youtube-dl $YOUTUBE_URL -o - | \
ffmpeg -hide_banner -loglevel panic -re -i pipe:0 -strict -2 -vcodec mjpeg -r 30 -c:v libx264 \
-crf 18 -profile:v baseline -maxrate 300k -bufsize 600k -pix_fmt yuv420p \
-codec:a libmp3lame -b:a 64k -flags -global_header -hls_allow_cache 0 \
-hls_time 5 -hls_wrap 6 /var/www/html/stream.m3u8
