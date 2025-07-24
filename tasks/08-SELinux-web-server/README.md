# Task 08 - Debug SELinux for Web Server on Port 82

##  Validation Instruction
Your setup will be validated using a script. Run `./validate.sh` after completing the task.

---

##  Objective

- A web server running on non-standard port **82** is not serving content.
- Debug and fix the issue using **SELinux and firewall configurations**.
- Ensure that the web server can serve existing HTML files from `/var/www/html`.
- The web service should **start automatically at boot time**.

---

##  Instructions

1. Install the Apache web server.
2. Configure Apache to listen on port `82`.
3. Add SELinux rule to allow HTTP traffic on port `82`.
4. Open the port in the system firewall.
5. Enable and start the Apache service.
6. Reboot the system and ensure the service works automatically.

