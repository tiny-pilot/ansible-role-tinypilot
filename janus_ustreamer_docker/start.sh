/ustreamer/ustreamer -f 30 --host 127.0.0.1 -p8001 --h264-sink tinypilot::ustreamer::h264 --h264-sink-rm --h264-sink-mode 777 --format uyvy --encoder omx &
/opt/janus/bin/janus -F /opt/janus/lib/janus/configs/ -P /opt/janus/lib/janus/plugins/
