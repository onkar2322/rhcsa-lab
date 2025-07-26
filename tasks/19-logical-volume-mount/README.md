## Task 19: Create a Logical Volume and Mount it Permanently

###  Question:
Create the logical volume with the name `wshare` by using **50 LEs** from the volume group `wgroup`.  
- Each **PE (Physical Extent)** size of the volume group is **8 MB**.  
- Mount the volume on `/mnt/wshare` with the **vfat** file system.  
- Ensure it is mounted **permanently**.

###  Validation Criteria:
- A logical volume named `wshare` exists under volume group `wgroup`.
- It uses exactly 50 LEs (400 MB total if PE=8MB).
- It is formatted with the `vfat` filesystem.
- It is mounted on `/mnt/wshare`.
- The mount is permanently configured in `/etc/fstab`.

###  Validate Script:
Run the `validate.sh` script to check if the setup is correct.

```bash
./validate.sh

