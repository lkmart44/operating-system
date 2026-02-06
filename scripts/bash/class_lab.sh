#!/bin/bash

################################################################################
# Class Lab: Bash Commands Practice
# File: class_lab.sh
# Purpose: Solutions to BashCommands.txt.docx challenges
################################################################################

echo "==========================================="
echo "PART I: THE CHALLENGES"
echo "==========================================="

echo ""
echo "--- PROCESSES & DAEMONS ---"
echo ""

# 1. List a specific process: nginx
echo "1. List all running processes associated with nginx daemon:"
echo "Command: ps aux | grep nginx"
# ps aux | grep nginx

# 2. Kill by name
echo ""
echo "2. Kill all processes named my_script.sh without looking up PIDs:"
echo "Command: pkill my_script.sh"
# pkill my_script.sh

# 3. Background execution
echo ""
echo "3. Run backup.sh in background (continues after logout):"
echo "Command: nohup ./backup.sh &"
# nohup ./backup.sh &

# 4. Find PID
echo ""
echo "4. Extract only the PID of sshd daemon:"
echo "Command: pidof sshd"
echo "Alternative: pgrep sshd"
# pidof sshd
# pgrep sshd

# 5. Process Hierarchy
echo ""
echo "5. View processes in tree format:"
echo "Command: pstree"
echo "Alternative: ps auxf"
# pstree
# ps auxf

# 6. Open Files
echo ""
echo "6. List all files opened by process PID 1234:"
echo "Command: lsof -p 1234"
# lsof -p 1234

# 7. Check Daemon Status
echo ""
echo "7. Check if docker daemon is active (systemd):"
echo "Command: systemctl is-active docker"
echo "Alternative: systemctl status docker"
# systemctl is-active docker

# 8. Priority
echo ""
echo "8. Start heavy_calc.sh with lowest CPU priority:"
echo "Command: nice -n 19 ./heavy_calc.sh"
# nice -n 19 ./heavy_calc.sh

echo ""
echo "--- FILES, COPYING & ARCHIVING ---"
echo ""

# 1. Recursive Copy
echo "1. Copy folder recursively:"
echo "Command: cp -r /var/www/html /backup/html"
# cp -r /var/www/html /backup/html

# 2. Preserve Attributes
echo ""
echo "2. Copy file preserving timestamps, ownership, permissions:"
echo "Command: cp -p secret.key /tmp/"
echo "Alternative: cp --preserve=all secret.key /tmp/"
# cp -p secret.key /tmp/

# 3. Sync Directories
echo ""
echo "3. Rsync - copy only newer or missing files:"
echo "Command: rsync -av --update src/ dest/"
# rsync -av --update src/ dest/

# 4. Update Copy
echo ""
echo "4. Copy only if source is newer:"
echo "Command: cp -u dir1/* dir2/"
# cp -u dir1/* dir2/

# 5. Remote Copy
echo ""
echo "5. Copy local file to remote server via SCP:"
echo "Command: scp app.conf user@192.168.1.50:/etc/"
# scp app.conf user@192.168.1.50:/etc/

# 6. Archive & Compress
echo ""
echo "6. Create .tar.gz archive of /var/log:"
echo "Command: tar -czf var_log_backup.tar.gz /var/log"
# tar -czf var_log_backup.tar.gz /var/log

echo ""
echo "--- THE FIND COMMAND ---"
echo ""

# 1. Size Search
echo "1. Find files larger than 500MB in /home:"
echo "Command: find /home -type f -size +500M"
# find /home -type f -size +500M

# 2. Time Search
echo "2. Find files modified in last 7 days in /var/log:"
echo "Command: find /var/log -type f -mtime -7"
# find /var/log -type f -mtime -7

# 3. User Search
echo "3. Find files owned by user jenkins in /tmp:"
echo "Command: find /tmp -user jenkins"
# find /tmp -user jenkins

# 4. Find & Delete
echo "4. Find and delete all empty directories in /data:"
echo "Command: find /data -type d -empty -delete"
# find /data -type d -empty -delete

# 5. Permission Search
echo "5. Find files with 777 permissions in current directory:"
echo "Command: find . -type f -perm 0777"
# find . -type f -perm 0777

# 6. Find & Copy
echo "6. Find all .jpg files and copy to /images/:"
echo "Command: find . -name '*.jpg' -exec cp {} /images/ \;"
# find . -name '*.jpg' -exec cp {} /images/ \;

echo ""
echo "--- REGULAR EXPRESSIONS (GREP, SED, AWK) ---"
echo ""

# 1. Email Extraction
echo "1. Extract all valid email addresses from contacts.txt:"
echo "Command: grep -E -o '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}' contacts.txt"
# grep -E -o '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}' contacts.txt

# 2. Case Insensitive Search
echo ""
echo "2. Search for 'error' case-insensitively in syslog:"
echo "Command: grep -i 'error' syslog"
# grep -i 'error' syslog

# 3. Line Start Anchor
echo ""
echo "3. Find lines starting with 'root' in config.ini:"
echo "Command: grep '^root' config.ini"
# grep '^root' config.ini

# 4. Invert Match
echo ""
echo "4. Display lines NOT containing IP 192.168.1.1:"
echo "Command: grep -v '192.168.1.1' access.log"
# grep -v '192.168.1.1' access.log

# 5. Recursive Grep
echo ""
echo "5. Search for 'TODO' in all text files recursively:"
echo "Command: grep -r 'TODO' ."
echo "Alternative: grep -R 'TODO' ."
# grep -r 'TODO' .

# 6. Sed Replace
echo ""
echo "6. Replace 'localhost' with '127.0.0.1' in-place:"
echo "Command: sed -i 's/localhost/127.0.0.1/g' hosts.txt"
# sed -i 's/localhost/127.0.0.1/g' hosts.txt

# 7. Comment Removal
echo ""
echo "7. View config file without comment lines (starting with #):"
echo "Command: grep -v '^#' config.conf"
echo "Alternative: sed '/^#/d' config.conf"
# grep -v '^#' config.conf

# 8. IP Validation
echo ""
echo "8. Find lines with IPv4 address pattern:"
echo "Command: grep -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' file.txt"
# grep -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' file.txt

echo ""
echo "--- COMPLEX COMBINATIONS ---"
echo ""

# 1. Process & Regex
echo "1. List processes running as root:"
echo "Command: ps aux | grep '^root'"
# ps aux | grep '^root'

# 2. Find, Regex & Execute
echo ""
echo "2. Find .log files, search for 'Critical', print filename if found:"
echo "Command: find . -name '*.log' -exec grep -l 'Critical' {} \;"
echo "Alternative: grep -l 'Critical' $(find . -name '*.log')"
# find . -name '*.log' -exec grep -l 'Critical' {} \;

echo ""
echo "==========================================="
echo "END OF CHALLENGES"
echo "==========================================="
