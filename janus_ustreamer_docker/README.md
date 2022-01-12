## Requirements

* This must run on a Raspberry Pi device.

## Install Docker

```bash
curl -fsSL https://get.docker.com | sudo sh && \
  dockerd-rootless-setuptool.sh install
```

## Building

```bash
docker build -t janus-ustreamer .
```

## Running

Port `8001` is where ustreamer is listening for mjpeg stream requests (nice to have as a fallback)

Port `8002` is where janus is listening for websocket requests

```bash
docker run \
  --privileged \
  --network host \
  --publish 8001:8001 \
  --publish 8002:8002 \
  --name janus-ustreamer \
  janus-ustreamer:latest
```
