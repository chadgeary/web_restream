# Reference
Ansible playbook to re-host a video or live stream using apache httpd, ffmpeg, HLS.js, and youtube-dl.

# Notes
- /var/www/html is mounted as a small ram disk
- The stream replays continuously (systemd restarts the service), based on the URL in the playbook
- The URL may also be changed via editing /var/spool/web_restream.input

# Deployment
```
# locally
ansible-playbook web_restream.yml --extra-vars "target=localhost youtube_url='https://www.youtube.com/watch?v=REPLACE_WITH_VIDEO_ID'"
```
