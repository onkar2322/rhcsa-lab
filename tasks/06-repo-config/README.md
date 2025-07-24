# RHCSA Practice Task 06: Configure YUM Client Repository

 **Objective**  
Configure your system (`alpha.domain1.example.com`) as a YUM client that can install packages from a custom repository server.

 **Validation**  
Your setup will be validated using a script. Run `./validate.sh` after completing the task.

---

 **Instructions**

1. Create a YUM repository configuration file at `/etc/yum.repos.d/server.repo`.
2. Add the following two repository entries:
   - **BaseOS**
     - Name: (Fill this yourself)
     - BaseURL: (Fill this yourself)
     - Enabled: (Fill this yourself)
     - GPG Check: (Fill this yourself)
  
    - **AppStream**
     - Name: (Fill this yourself)
     - BaseURL: (Fill this yourself)
     - Enabled: (Fill this yourself)
     - GPG Check: (Fill this yourself)

3. Use `yum repolist` or `dnf repolist` to ensure repositories are listed correctly.

---


