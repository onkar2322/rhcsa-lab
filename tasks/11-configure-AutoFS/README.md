# Task 11: Configure AutoFS

##  Objective

Configure your system so that `ldapuser2`'s home directory is automatically mounted using AutoFS from an NFS server.

##  Question

- All `ldapuser2` home directory is exported via NFS, which is available on `classroom.example.com` (172.25.254.254).
- Your NFS-exports directory is `/home/guests` for `ldapuser2`.
- `ldapuser2`'s home directory is:  
  `classroom.example.com:/home/guests/ldapuser2`
- `ldapuser2`'s home directory should be automounted using the `autofs` service.
- Home directories must be writable by their users.
- While you are able to log in as any of the users `ldapuser1` through `ldapuser20`, the only home directory that is accessible from your system should be `ldapuser2`.

##  Instructions

1. Install the `autofs` package if it's not already installed.
2. Edit the `/etc/auto.master` file to define the AutoFS mount point and link it to a new map file (e.g., `/etc/auto.guests`).
3. Create the `/etc/auto.guests` file and configure it to mount `ldapuser2`'s home directory using NFS (version 4).
4. Reload and enable the `autofs` service to apply the new configuration.
5. Ensure the directory `/home/guests/ldapuser2` is only accessible when needed (i.e., on-demand) and writable by `ldapuser2`.
6. Verify that `ldapuser2`'s home directory is not mounted permanently and is automounted only upon access.

##  Validation

Once you have completed the configuration, run the following validation script to test your setup:

```bash
./validate.sh

