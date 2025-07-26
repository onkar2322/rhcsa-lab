## Task 14 - Locate and Copy All Files Owned by User "harry"

###  Task Description:
Locate **all files** on the system **owned by the user `harry`** and **copy them into `/root/harry-files/`** directory.

###  Instructions:
- Create the target directory `/root/harry-files` if it does not exist.
- Preserve ownership and permissions where possible.

###  Validation Criteria:
- All files owned by `harry` should exist under `/root/harry-files`.
- Ownership and file content should be identical to the original.

###  To validate, run:
```bash
./validate.sh

