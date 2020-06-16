# Ansible Role: KVM Pi

[![CircleCI](https://circleci.com/gh/mtlynch/ansible-role-kvmpi.svg?style=svg)](https://circleci.com/gh/mtlynch/ansible-role-kvmpi) [![Ansible Galaxy](https://img.shields.io/badge/ansible--galaxy-kvmpi-blue.svg?style=flat-square)](https://galaxy.ansible.com/mtlynch/kvmpi) [![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](LICENSE)

Ansible role for [KVM Pi](https://github.com/mtlynch/kvmpi).

## Role Variables

Available variables are listed below, along with default values (see [defaults/main.yml](defaults/main.yml)):

```yaml
kvmpi_group: kvmpi
kvmpi_user: kvmpi
kvmpi_dir: /opt/kvmpi
kvmpi_repo: https://github.com/mtlynch/kvmpi.git
kvmpi_interface: '0.0.0.0'
kvmpi_port: 8000
kvmpi_hid_path: /dev/hidg0
```

## Dependencies

None

## Example Playbook

#### `example.yml`

```yaml
- hosts: all
  roles:
    - role: mtlynch.kvmpi
```

### Running Example Playbook

```bash
ansible-galaxy install mtlynch.kvmpi
ansible-playbook example.yml
```

## License

MIT

## Author Information

This role was created in 2020 by [Michael Lynch](http://mtlynch.io).