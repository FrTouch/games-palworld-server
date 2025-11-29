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
| `steamcmd_user` | *steam* | User which will run the game servers |

Dependencies
------------

There are no dependencies for this role.

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

Log into your server, and elevate as your SteamCMD user, and simply try to start SteamCMD.
```
steamcmd
```