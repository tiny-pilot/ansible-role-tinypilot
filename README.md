# Ansible Role: Key Mime Pi

[![License](http://img.shields.io/:license-apache-blue.svg?style=flat-square)](LICENSE)

Ansible role for [Key Mime Pi](https://github.com/mtlynch/key-mime-pi).

## Role Variables

Available variables are listed below, along with default values (see [defaults/main.yml](defaults/main.yml)):

```yaml
key_mime_pi_group: keymimepi
key_mime_pi_user: keymimepi
key_mime_pi_dir: /opt/key-mime-pi
key_mime_pi_repo: https://github.com/mtlynch/key-mime-pi.git
```

## Dependencies

None

## Example Playbook

#### `example.yml`

```yaml
- hosts: all
  roles:
    - { role: mtlynch.key-mime-pi }
```

### Running Example Playbook

```bash
ansible-galaxy install mtlynch.key-mime-pi
ansible-playbook example.yml
```

## License

MIT

## Author Information

This role was created in 2020 by [Michael Lynch](http://mtlynch.io).