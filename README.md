# Ansible Role: TinyPilot

[![CircleCI](https://circleci.com/gh/tiny-pilot/ansible-role-tinypilot.svg?style=svg)](https://circleci.com/gh/tiny-pilot/ansible-role-tinypilot)
[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](LICENSE)

Ansible role for [TinyPilot KVM](https://github.com/tiny-pilot/tinypilot).

## Role Variables

Available variables are listed below, along with default values (see [defaults/main.yml](defaults/main.yml)):

```yaml
tinypilot_group: tinypilot
tinypilot_dir: /opt/tinypilot
tinypilot_interface: '127.0.0.1'
tinypilot_port: 8000
tinypilot_keyboard_interface: /dev/hidg0
```

Mandatory variables are listed below:

```yaml
# Specify the filesystem path or URL of a Debian package that installs
# TinyPilot.
tinypilot_debian_package_path: tinypilot-00000000000000-1-armhf.deb
```

## Dependencies

* [tiny-pilot.ustreamer](https://github.com/tiny-pilot/ansible-role-ustreamer)
* [tiny-pilot.nginx](https://github.com/tiny-pilot/ansible-role-nginx)

## Example Playbook

#### `example.yml`

```yaml
- hosts: all
  roles:
    - role: ansible-role-tinypilot
```

### Running Example Playbook

```bash
TINYPILOT_DEBIAN_PACKAGE='tinypilot-00000000000000-1-armhf.deb'

ansible-galaxy install git+https://github.com/tiny-pilot/ansible-role-tinypilot.git
ansible-playbook example.yml \
  --extra-vars "tinypilot_debian_package_path=${TINYPILOT_DEBIAN_PACKAGE}"
```

## Documentation

- [Introduction to the USB gadget driver](docs/usb-gadget-driver.md)

## License

MIT

## Author Information

This role was created in 2020 by [Michael Lynch](http://mtlynch.io).
