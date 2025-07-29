## Task 22: Create User accounts with supplementary group

### Requirements:

1. Create a group named `sysadms`.
2. Create users:
   - `natasha` and `harry` must be members of the `sysadms` group (as supplementary group members).
   - `sarah` must:
     - Not be a member of `sysadms`.
     - Have a non-interactive shell (e.g., `/sbin/nologin`).
3. Set the password for all users to `trootent`


## Validation
- Run = ./validate.sh
.
