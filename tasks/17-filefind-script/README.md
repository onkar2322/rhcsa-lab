# Task 17 - findfiles.sh Script

## Objective
- Create a script named findfiles.sh in /usr/local/bin which finds all the files of having size greater than 30kb, less than 50kb and having SETUUID, The output of the file should be redirected to /var/findoutput.

- All files with:
  - Size greater than 30 KB and less than 50 KB
  - SETUID bit set

The script should redirect its output to `/var/findoutput`.

## Instructions
1. Create a script file at `/usr/local/bin/findfiles.sh`.
2. The script should include a `find` command to meet the criteria.
3. Ensure the script is executable.
4. Run the script and verify that the output is saved in `/var/findoutput`.

## Validation
Run the following to verify the script and output:
```bash
./validate.sh
