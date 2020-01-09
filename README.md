# Reference
Ansible playbook to re-host a video or live stream using apache httpd, ffmpeg, HLS.js, and youtube-dl.

# Deployment
```
# locally
ansible-playbook web_restream.yml --extra-vars "target=localhost youtube_url='https://www.youtube.com/watch?v=REPLACE_WITH_VIDEO_ID'"
```
