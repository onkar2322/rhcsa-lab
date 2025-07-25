# Task 09: Create a Collaborative Directory

 **Validation:**  
Your setup will be validated using a script. Run `./validate.sh` after completing the task.

## Objective:
1. Create a directory `/home/manager`.
2. Set group ownership of the directory to `sysadms`.
3. Ensure the directory is fully accessible by members of `sysadms` group.
4. Prevent access for users not in `sysadms` group (except root).
5. Ensure all future files in the directory inherit the `sysadms` group ownership.

## Instructions:
- Create the group `sysadms` (if it doesn't exist).
- Create the directory `/home/manager`.
- Change the group ownership of `/home/manager` to `sysadms`.
- Set group permissions (`rwx`) and apply the **setgid** bit.
- Remove all permissions for others (`---`).

