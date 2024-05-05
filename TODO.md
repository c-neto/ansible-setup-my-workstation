moby engine installation:

```
Create the docker group if it does not exist
$ sudo groupadd docker

Add your user to the docker group.
$ sudo usermod -aG docker $USER

Log in to the new docker group (to avoid having to log out / log in again; but if not enough, try to reboot):
$ newgrp docker
```

--- 


krew install

https://krew.sigs.k8s.io/docs/user-guide/setup/install/


---

Print screen Gnome Settings (GNOME 41 issues)

```toml
[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0]
binding='<Shift><Alt>x'
command='flameshot gui'
name='print-1'

[org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1]
binding='Print'
command='flameshot gui'
name='print-2'
```