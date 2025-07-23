#  Task 3 : Create a Group and Add User to It

##  Objective:
1. Create a new group named `devteam`.
2. Create a user named `devadmin`.
3. Add `devadmin` to the `devteam` group (as a supplementary group).

---

##  Validation:
- Group `devteam` must exist.
- User `devadmin` must exist.
- `devadmin` must be a **member** of the `devteam` group.

---

##  Hints:
- Use `groupadd`, `useradd`, and `usermod` commands.
- Verify group membership using `id devadmin`.

