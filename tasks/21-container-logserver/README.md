## Task 21: Container-Based Log Server Setup

## Question:
- Create a container logserver from an image rsyslog in node1 from registry.lab.example.com.
- Configure the container with systemd services by an existing user "Walhalla".
- Service name should be container-logserver, and configure it to start automatically across reboot.
- Configure your host journal to store all journal across reboot.
- Copy all *.journal from /var/log/journal and all subdirectories to /home/Walhalla/container_logserver.
- Configure automount /var/log/journal from logserver (container) to /home/Walhalla/container_logserver when container starts.

## Objectives:

- Deploy container using podman or docker with rsyslog image from the registry.

- Create systemd service unit to control container lifecycle as Walhalla user.

- Enable persistent journal logging using journald.conf configuration.

- Setup systemd automount behavior or volume mount for container.

- Copy journal logs using cp -r or find for all .journal files.

## Validation
- Run  = ./validate.sh


