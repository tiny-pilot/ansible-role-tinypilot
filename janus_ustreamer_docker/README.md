## building

```sudo docker build -t janus_ustreamer .```

## running

port `8001` is where ustreamer is listening for mjpeg stream requests (nice to have as a fallback)

port `8002` is where janus is listening for websocket requests

```sudo docker run --privileged -p8001:8001 -p8002:8002 janus_ustreamer:latest```