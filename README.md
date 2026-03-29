# OSS Audit — Git
### Open Source Software Capstone Project

**Student:** Riddhi Sharma
**Registration Number:** 24BAI10674
**Course:** Open Source Software (OSS NGMC)
**Chosen Software:** Git (GPL v2)

---

## About This Project

This repository is part of *The Open Source Audit* capstone project.
The chosen software is **Git** — the distributed version control system
created by Linus Torvalds in 2005, licensed under GPL v2.

The project includes five shell scripts demonstrating Linux command-line
skills connected to Git's open-source philosophy.

---

## Repository Structure
```
oss-audit-24BAI10674/
├── script1_system_identity.sh
├── script2_package_inspector.sh
├── script3_disk_auditor.sh
├── script4_log_analyzer.sh
├── script5_manifesto.sh
└── README.md
```

---

## Scripts Overview

### Script 1 — System Identity Report
Displays a formatted welcome screen showing the Linux distribution,
kernel version, logged-in user, home directory, uptime, date/time,
and the open-source license covering the OS and Git.

**Concepts:** Variables, `echo`, command substitution `$()`, `uname`, `whoami`, `uptime`, `date`

---

### Script 2 — FOSS Package Inspector
Checks whether Git is installed, shows version and license details,
then prints open-source philosophy notes using a `case` statement.

**Concepts:** `if-then-else`, `case` statement, `which`, `grep`

---

### Script 3 — Disk and Permission Auditor
Loops through key system directories and reports permissions, owner,
group, and disk size. Also checks Git's config file and binary location.

**Concepts:** `for` loop, arrays, `ls -ld`, `du -sh`, `awk`, `cut`

---

### Script 4 — Log File Analyzer
Reads a log file line by line, counts lines containing a keyword,
prints a summary, and shows the last 5 matching lines. Includes a
retry mechanism for missing or empty files.

**Concepts:** `while read` loop, `if-then`, counter variables, `grep`, `tail`

**Usage:**
```bash
./script4_log_analyzer.sh /var/log/syslog error
```

---

### Script 5 — Open Source Manifesto Generator
Asks three interactive questions and generates a personalised
open-source philosophy statement, saving it to a `.txt` file.

**Concepts:** `read`, string concatenation, `>` and `>>` file writing, `date`, aliases (via comments)

---

## How to Run

### Prerequisites
- Linux system (Ubuntu, Fedora, or any distro) or JDoodle (online)
- Bash shell
- Git installed

### Steps
```bash
# 1. Clone the repo
git clone https://github.com/YOUR-USERNAME/oss-audit-24BAI10674.git
cd oss-audit-24BAI10674

# 2. Make scripts executable
chmod +x *.sh

# 3. Run each script
./script1_system_identity.sh
./script2_package_inspector.sh
./script3_disk_auditor.sh
./script4_log_analyzer.sh /var/log/syslog error
./script5_manifesto.sh
```

---

## Dependencies

All scripts use standard Linux utilities — no external installs needed.

| Script | Tools Used |
|--------|-----------|
| Script 1 | `uname`, `whoami`, `uptime`, `date` |
| Script 2 | `which`, `git` |
| Script 3 | `ls`, `du`, `awk`, `cut` |
| Script 4 | `grep`, `tail`, `wc` |
| Script 5 | `date`, `cat` |
```

4. Scroll down → click **"Commit changes"**

---

## Step 4 — Copy Your Repo Link

Your repo link will be:
```
https://github.com/YOUR-USERNAME/oss-audit-24BAI10674
