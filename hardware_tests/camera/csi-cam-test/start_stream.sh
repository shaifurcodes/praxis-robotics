#!/bin/sh
sudo killall -9 gst-launch-1.0 2>/dev/null; sudo systemctl restart nvargus-daemon; sleep 2

gst-launch-1.0 -e \
  nvarguscamerasrc sensor-id=0 ! 'video/x-raw(memory:NVMM), width=1280, height=720, framerate=30/1' ! \
  nvvidconv ! 'video/x-raw, format=I420' ! \
  x264enc speed-preset=ultrafast tune=zerolatency bitrate=2500 key-int-max=30 threads=2 option-string="repeat-headers=1" ! \
  h264parse config-interval=1 ! rtph264pay config-interval=1 pt=96 ! \
  udpsink host=192.168.2.1 port=5000 sync=false \
  nvarguscamerasrc sensor-id=1 ! 'video/x-raw(memory:NVMM), width=1280, height=720, framerate=30/1' ! \
  nvvidconv ! 'video/x-raw, format=I420' ! \
  x264enc speed-preset=ultrafast tune=zerolatency bitrate=2500 key-int-max=30 threads=2 option-string="repeat-headers=1" ! \
  h264parse config-interval=1 ! rtph264pay config-interval=1 pt=96 ! \
  udpsink host=192.168.2.1 port=5002 sync=false
