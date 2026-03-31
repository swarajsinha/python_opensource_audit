# python_opensource_audit
# 🐍 The Open Source Audit — Python

> **Course:** Open Source Software | VITyarthi  
> **Student Name:** `Swaraj Sinha`  
> **Roll Number:** `24BCE10819`  
> **Chosen Software:** Python 3 (CPython) — Python Software Foundation License  
> **Submission Date:** March 2026

---

## 📋 Table of Contents

- [About This Repository](#about-this-repository)
- [Chosen Software — Python](#chosen-software--python)
- [Repository Structure](#repository-structure)
- [Shell Scripts Overview](#shell-scripts-overview)
- [Dependencies](#dependencies)
- [Step-by-Step Setup (WSL on Windows)](#step-by-step-setup-wsl-on-windows)
- [Running Each Script](#running-each-script)
- [Expected Output](#expected-output)
- [License](#license)

---

## 📁 About This Repository

This repository contains the complete submission for the **Open Source Audit** project. It includes:

- A **16-page written report** auditing Python as an open-source project, covering its origin story, license analysis, ethical reflections, Linux footprint, FOSS ecosystem, and a comparison with its proprietary alternative (MATLAB).
- **Five shell scripts** that demonstrate practical Linux command-line skills, each tied to a unit of the course.

All scripts were written and tested on **Ubuntu 22.04 running inside WSL2 on Windows 11**.

---

## 🐍 Chosen Software — Python

| Field | Detail |
|---|---|
| **Software** | Python 3 (CPython — the reference implementation) |
| **License** | Python Software Foundation License v2 (PSF-2.0) |
| **License Type** | Permissive open-source (similar to MIT) |
| **First Released** | February 1991 by Guido van Rossum |
| **Governing Body** | Python Software Foundation (PSF) |
| **Source Code** | https://github.com/python/cpython |
| **Official Site** | https://www.python.org |

Python was created to fill the gap between quick-but-limited shell scripting and powerful-but-verbose languages like C. It was open-sourced from day one — Guido van Rossum's deliberate decision after seeing how closedness had stunted its predecessor, ABC. Today it powers scientific computing, AI/ML, web development, and automation across every industry.

---

## 📂 Repository Structure

```
open-source-audit-python/
│
├── README.md                 
├── report/
│   └── python_open_source_audit.pdf  
│
└── scripts/
    ├── script1.sh             ← System Identity Report
    ├── script2.sh             ← FOSS Package Inspector
    ├── script3.sh             ← Disk and Permission Auditor
    ├── script4.sh             ← Log File Analyzer
    ├── script5.sh             ← Open Source Manifesto Generator
    └── manifesto_akshat_20260328.txt             
```

---

## 📜 Shell Scripts Overview

### Script 1 — System Identity Report (`script1.sh`)

**Purpose:** Displays a formatted welcome screen showing key information about the current Linux system — the distribution name, kernel version, logged-in user, home directory, uptime, current date/time, and the open-source license of the operating system.

**Shell concepts demonstrated:**
- Variables (`STUDENT_NAME`, `KERNEL`, `DISTRO`)
- Command substitution using `$()` — e.g., `$(uname -r)`, `$(whoami)`, `$(date)`
- `echo` with formatted string output
- Reading system files with `cat /etc/os-release`
- Piping with `grep` and `cut` and `tr` to extract specific fields

---

### Script 2 — FOSS Package Inspector (`script2.sh`)

**Purpose:** Checks whether Python 3 is installed on the system, prints its version and package information, and uses a `case` statement to print a one-line philosophy note about the package based on its name.

**Shell concepts demonstrated:**
- `if-then-else` conditional logic
- `command -v` to check if a program exists (cross-distro compatible)
- `dpkg -l` (Debian/Ubuntu) and `rpm -qi` (Fedora/RHEL) for package inspection
- Piping with `grep -E` for pattern matching
- `case` statement with multiple pattern branches and wildcard `*)`
- `awk` to reformat `dpkg` output

---

### Script 3 — Disk and Permission Auditor (`script3.sh`)

**Purpose:** Loops through a list of important Linux system directories and reports the permissions, owner, group, and disk usage of each. Also checks specifically for Python's library directory and reports its permissions.

**Shell concepts demonstrated:**
- `for` loop iterating over a bash array (`"${DIRS[@]}"`)
- Array declaration with `DIRS=(...)`
- Directory existence check with `[ -d "$DIR" ]`
- `ls -ld` for directory metadata
- `awk` to extract specific columns from command output
- `du -sh` for human-readable disk usage
- `2>/dev/null` to suppress permission-denied errors
- `find` to locate Python's library path dynamically

---

### Script 4 — Log File Analyzer (`script4.sh`)

**Purpose:** Reads a log file line by line, counts how many lines contain a user-specified keyword (defaulting to "error"), prints the total count, and displays the last 5 matching lines. Accepts the log file path and keyword as command-line arguments.

**Shell concepts demonstrated:**
- Command-line arguments with `$1` and `$2`
- Default value with `${2:-"error"}` parameter expansion
- File validation with `[ ! -f ]` and `[ ! -s ]`
- `while IFS= read -r LINE` loop for safe line-by-line file reading
- Counter variable with `$((COUNT + 1))` arithmetic
- `grep -iq` for case-insensitive silent pattern matching
- `tail -5` to display the last 5 results

---

### Script 5 — Open Source Manifesto Generator (`script5.sh`)

**Purpose:** Interactively asks the user three questions, then composes and saves a personalised open-source philosophy statement to a `.txt` file named after the current user and today's date.

**Shell concepts demonstrated:**
- `read -p` for interactive user input with inline prompts
- String concatenation by combining variables inside `echo` strings
- File creation and writing with `>` (overwrite) and `>>` (append)
- `date` command with custom format strings
- Dynamic filename generation using `$(whoami)` and `$(date +%Y%m%d)`
- `cat` to display the saved file after writing

---

## 🔧 Dependencies

All dependencies below are available by default on Ubuntu/WSL. Install any missing ones with the commands shown.

| Tool | Used In | How to Install (Ubuntu/WSL) |
|---|---|---|
| `bash` | All scripts | Pre-installed |
| `uname` | Script 1 | Pre-installed (part of `coreutils`) |
| `whoami` | Scripts 1, 5 | Pre-installed |
| `uptime` | Script 1 | Pre-installed |
| `date` | Scripts 1, 5 | Pre-installed |
| `cat`, `grep`, `cut`, `tr` | Scripts 1, 2, 4 | Pre-installed |
| `awk` | Scripts 2, 3 | Pre-installed (part of `gawk`) |
| `dpkg` | Script 2 | Pre-installed on Ubuntu/Debian |
| `python3` | Script 2 (subject) | `sudo apt install python3` |
| `ls`, `du`, `find` | Script 3 | Pre-installed |
| `tail` | Script 4 | Pre-installed |
| `nano` | Setup (editing) | `sudo apt install nano` |

> **Note for Fedora/RHEL users:** Script 2 uses `dpkg` by default. Swap it for `rpm -qi python3` if you are on an RPM-based system — the script includes a commented fallback for this.

---

## 🛠️ Step-by-Step Setup (WSL on Windows)

Follow these steps exactly if you are running on **Windows with WSL2** (which is the environment these scripts were developed and tested on).

### Step 1 — Install WSL (skip if already done)

Open **PowerShell as Administrator** and run:
```powershell
wsl --install
```
Restart your laptop when prompted. After restart, open **Ubuntu** from the Start Menu. Set a username and password when asked.

### Step 2 — Update Ubuntu

```bash
sudo apt update && sudo apt upgrade -y
```

### Step 3 — Install Python3 (if not already present)

```bash
sudo apt install python3 -y
python3 --version
```

### Step 4 — Clone This Repository

```bash
cd ~
git clone https://github.com/akshat-2600/open-source-audit-python.git
cd open-source-audit-python/scripts
```

> If you don't have git: `sudo apt install git -y`

**Or, if downloading manually (without git):**

```bash
cd ~
mkdir open-source-audit-python
cd open-source-audit-python/scripts
# Copy the .sh files into this folder
```

### Step 5 — Make All Scripts Executable

```bash
chmod +x script1.sh script2.sh script3.sh script4.sh script5.sh
```

This is required on Linux before any `.sh` file can be run. Without it, you will get a `Permission denied` error.

### Step 6 — Create the Test Log File (required for Script 4)

```bash
cat > ~/test.log << EOF
INFO: System started successfully
ERROR: Failed to connect to database
WARNING: Disk usage above 80 percent
ERROR: Timeout while loading module
INFO: Retry successful
WARNING: Memory usage high
ERROR: Authentication failed for user root
INFO: Backup completed
EOF
```

---

## ▶️ Running Each Script

Make sure you are inside the `scripts/` directory before running:

```bash
cd ~/open-source-audit-python/scripts
```

### Script 1
```bash
./script1.sh
```

### Script 2
```bash
./script2.sh
```

### Script 3
```bash
./script3.sh
```

### Script 4
```bash
# Basic usage — searches for 'error' by default
./script4.sh ~/test.log

# Search for a specific keyword
./script4.sh ~/test.log error
./script4.sh ~/test.log warning
./script4.sh ~/test.log info

# Use the real system log (if available on your distro)
./script4.sh /var/log/syslog error
```

### Script 5
```bash
./script5.sh
```
When prompted, type your answers and press **Enter** after each one. The manifesto will be saved to a file named `manifesto_<username>_<date>.txt` in the current directory.

---

## 💡 Expected Output

### Script 1
```
================================
 Open Source Audit — [Your Name]
================================
Distro    : Ubuntu 22.04.3 LTS
Kernel    : 5.15.133.1-microsoft-standard-WSL2
User      : yourname
Home Dir  : /home/yourname
Uptime    : up 1 hour, 23 minutes
Date/Time : Saturday, 28 March 2026 14:32:10
OS License: GNU General Public License v2
Software  : Python — PSF License
================================
```

### Script 2
```
python3 is installed.
Version: Python 3.10.12
Package: python3 | Version: 3.10.6-1~22.04
Philosophy: Python — 30 years of open collaboration that powered the AI revolution
```

### Script 3
```
Directory Audit Report
----------------------
/etc => Permissions: drwxr-xr-x root root | Size: 8.2M
/var/log => Permissions: drwxrwxr-x root syslog | Size: 48K
/home => Permissions: drwxr-xr-x root root | Size: 4.0K
/usr/bin => Permissions: drwxr-xr-x root root | Size: 156M
/tmp => Permissions: drwxrwxrwt root root | Size: 4.0K

--- Python Library Directory Check ---
Found: /usr/lib/python3
Permissions: drwxr-xr-x root root
```

### Script 4
```
Keyword 'error' found 3 times in /home/yourname/test.log

--- Last 5 matching lines ---
ERROR: Failed to connect to database
ERROR: Timeout while loading module
ERROR: Authentication failed for user root
```

### Script 5
```
=== Open Source Manifesto Generator ===
Answer three questions to generate your manifesto.

1. Name one open-source tool you use every day: Python
2. In one word, what does 'freedom' mean to you? choice
3. Name one thing you would build and share freely: a study planner

Manifesto saved to: manifesto_yourname_20260328.txt

=== MY OPEN SOURCE MANIFESTO ===
Generated on: 28 March 2026
Author: yourname

Every day, I rely on Python — a tool built not by one company for profit,
but by a community of people who believed that software should be free.
To me, freedom means choice: the ability to inspect, to change,
to share, and to improve. One day, I will build a study planner and release
it openly, so that someone I will never meet can stand on the
foundation I helped lay — just as I stand on the work of those before me.

Open source is not just a licence. It is a commitment.
```

---

## ⚠️ Common Errors and Fixes

| Error | Cause | Fix |
|---|---|---|
| `Permission denied` | Script not executable | Run `chmod +x scriptname.sh` |
| `command not found: python3` | Python not installed | `sudo apt install python3` |
| `File not found` in Script 4 | Wrong path passed | Use `./script4.sh ~/test.log` |
| `nano: command not found` | Nano not installed | `sudo apt install nano` |
| `bad interpreter: No such file` | Windows line endings in file | Run `sed -i 's/\r//' scriptname.sh` |
| Script 4 shows 0 matches | Keyword not in file | Try `./script4.sh ~/test.log info` |

---

