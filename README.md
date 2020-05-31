# Ansible Role: Key Mime Pi

[![Ansible Galaxy](https://img.shields.io/badge/ansible--galaxy-key-mime-pi-blue.svg?style=flat-square)](https://galaxy.ansible.com/mtlynch/key-mime-pi) [![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](LICENSE)

Ansible role for [Key Mime Pi](https://github.com/mtlynch/key-mime-pi).

## Role Variables

Available variables are listed below, along with default values (see [defaults/main.yml](defaults/main.yml)):

```yaml
key_mime_pi_group: keymimepi
key_mime_pi_user: keymimepi
key_mime_pi_dir: /opt/key-mime-pi
key_mime_pi_repo: https://github.com/mtlynch/key-mime-pi.git
key_mime_pi_interface: '0.0.0.0'
key_mime_pi_port: 8000
key_mime_pi_hid_path: /dev/hidg0
```

## Dependencies

None

## Example Playbook

#### `example.yml`

```yaml
- hosts: all
  roles:
    - role: mtlynch.keymimepi
```

### Running Example Playbook

```bash
ansible-galaxy install mtlynch.keymimepi
ansible-playbook example.yml
```

## License

MIT

## Author Information

This role was created in 2020 by [Michael Lynch](http://mtlynch.io).