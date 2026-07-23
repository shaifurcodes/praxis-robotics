#!/bin/sh
ffplay -window_title "Cam 0" -protocol_whitelist file,udp,rtp -probesize 500000 -analyzeduration 100000 -flags low_delay cam0.sdp & \
ffplay -window_title "Cam 1" -protocol_whitelist file,udp,rtp -probesize 500000 -analyzeduration 100000 -flags low_delay cam1.sdp &
