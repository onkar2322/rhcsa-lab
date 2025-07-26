# Task 12: Configure ACL on /var/tmp/fstab

## Question:
Copy the file /etc/fstab to /var/tmp/ and configure the "ACL" as mentioned following:

- The file /var/tmp/fstab should be owned by the "root".
- The file /var/tmp/fstab should belong to the group "root".
- The file /var/tmp/fstab should not be executable by any one.
- The user "sarah" should be able to read and write to the file.
- The user "harry" can neither read nor write to the file.
- Other users (future and current) should be able to read /var/tmp/fstab.

## Objective:
Configure access control lists (ACLs) for the file `/var/tmp/fstab` to meet the above conditions.

## Instructions (Without showing full answers):
1. Copy the file `/etc/fstab` to `/var/tmp/`.
2. Set the file ownership to `root:root`.
3. Remove execute permissions from all (user, group, others).
4. Set ACLs:
   - `sarah` should have read and write access.
   - `harry` should have no access at all.
   - All other users should have read-only access.

## Validation

Once you have completed the configuration, run the following validation script to test your setup:

```bash
./validate.sh
