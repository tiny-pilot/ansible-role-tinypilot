# Ansible Role: TinyPilot

[![CircleCI](https://circleci.com/gh/mtlynch/ansible-role-tinypilot.svg?style=svg)](https://circleci.com/gh/mtlynch/ansible-role-tinypilot) [![Ansible Galaxy](https://img.shields.io/badge/ansible--galaxy-tinypilot-blue.svg?style=flat-square)](https://galaxy.ansible.com/mtlynch/tinypilot) [![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](LICENSE)

Ansible role for [TinyPilot KVM](https://github.com/mtlynch/tinypilot).

## Role Variables

Available variables are listed below, along with default values (see [defaults/main.yml](defaults/main.yml)):

```yaml
tinypilot_group: tinypilot
tinypilot_dir: /opt/tinypilot
tinypilot_repo: https://github.com/mtlynch/tinypilot.git
tinypilot_repo_branch: master
tinypilot_interface: '127.0.0.1'
tinypilot_port: 8000
tinypilot_keyboard_interface: /dev/hidg0
```

## Dependencies

* [tiny-pilot.ustreamer](https://github.com/tiny-pilot/ansible-role-ustreamer)
* [tiny-pilot.nginx](https://github.com/tiny-pilot/ansible-role-nginx)

## Example Playbook

#### `example.yml`

```yaml
- hosts: all
  roles:
    - role: mtlynch.tinypilot
```

### Running Example Playbook

```bash
ansible-galaxy install mtlynch.tinypilot
ansible-playbook example.yml
```

## License

MIT

## Author Information

This role was created in 2020 by [Michael Lynch](http://mtlynch.io).
