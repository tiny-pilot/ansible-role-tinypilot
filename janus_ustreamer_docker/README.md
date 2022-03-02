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

**Note**: You can also make use of the pre-built Docker image by running the following command:

```bash
docker pull jdeanwallace/janus-ustreamer:2022-02-25
```

## Running

uStreamer should aleady be running on the device and listening on port `8001` for mjpeg stream requests, as a fallback.

To get Janus running and listening on port `8002` for websocket requests, run the following command:

```bash
docker run \
  --privileged \
  --network host \
  --volume /dev/shm:/dev/shm \
  --name janus-ustreamer \
  janus-ustreamer:latest
```

It will likely [fail](https://github.com/tiny-pilot/ansible-role-tinypilot/issues/167#issuecomment-1011419160), so you have to reboot the system and then run the same command again. It's unclear why the reboot is required.
