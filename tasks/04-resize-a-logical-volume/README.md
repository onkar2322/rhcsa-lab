# Task 04 - Resize a Logical Volume

## Objective:
1. Resize the logical volume named `mylv` so that **after reboot**, the size is **between 200MB and 300MB**.
2. Ensure the filesystem remains consistent and accessible.

## Instructions:
- Use tools like `lvresize`, `lvextend`, or `lvreduce` as appropriate.
- Make sure to unmount the logical volume and run filesystem checks before shrinking (if needed).
- Confirm the final size is persistent after a reboot.

## Validation: 
- Your setup will be validated using a script. Run `./validate.sh` after completing the task.
