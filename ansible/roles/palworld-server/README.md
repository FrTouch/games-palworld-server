Role SteamCMD
=========

This role is used to deploy SteamCMD on an Ubuntu 24.04LTS server.

Requirements
------------

No requirements.

Role Variables
--------------

| Variable name | Expeceted value | Description |
| ------------- | --------------- | ----------- |
| `palworld_server_dir` | */path/to/dir* | Path where the palworld server will be installed |

Dependencies
------------

SteamCMD must be installed for this role to work.

Example Playbook
----------------

You can use this role, for example, by creating a file **deploy_bind.yml**, and copying the following content.

    ---
    - name: Deploy Palworld server
      hosts: all
      become: yes
      roles:
        - steamcmd
        - palworld_server

Run with the following command.

```
ansible-playbook -i inventory.ini deploy_palworld_server.yml --ask-become-pass -u myuser
```

Validation
----------

No validation needed.