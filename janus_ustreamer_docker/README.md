## Requirements

* This must run on a Raspberry Pi device.

## Install Docker

```bash
curl -fsSL https://get.docker.com | sudo sh && \
  sudo usermod -aG docker $(whoami)
```

Log out and log in again for the docker permissions to take effect.

## Building

```bash
pushd $(mktemp -d) && \
  git clone https://github.com/tiny-pilot/ansible-role-tinypilot.git . && \
  git checkout experimental/h264 && \
  cd janus_ustreamer_docker && \
  docker build -t janus-ustreamer .
```

## Turn off uStreamer

If you're running uStreamer as a service, stop the service.

```bash
sudo service ustreamer stop
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
