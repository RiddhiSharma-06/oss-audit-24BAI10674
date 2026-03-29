#!/bin/bash
# =============================================================
# Script 1: System Identity Report
# Author: Riddhi Sharma | Reg: 24BAI10674
# Course: Open Source Software | Chosen Software: Git
# Description: Displays a welcome screen with system info and
#              details about the open-source OS license.
# NOTE: Adapted for JDoodle online Bash environment
# =============================================================

# --- Variables ---
STUDENT_NAME="Riddhi Sharma"
REG_NUMBER="24BAI10674"
SOFTWARE_CHOICE="Git"

# --- Gather system information using command substitution ---
KERNEL=$(uname -r)                            # Linux kernel version
USER_NAME=$(whoami)                           # Current logged-in user
HOME_DIR=$HOME                                # Home directory of current user
UPTIME=$(uptime -p 2>/dev/null || uptime)     # Uptime (fallback if -p not supported)
CURRENT_DATE=$(date '+%d %B %Y, %H:%M:%S')   # Formatted current date and time

# --- Get Linux distribution name safely ---
if [ -f /etc/os-release ]; then
    DISTRO=$(grep -w "PRETTY_NAME" /etc/os-release | cut -d= -f2 | tr -d '"')
else
    DISTRO="Linux (JDoodle Sandbox Environment)"
fi

# --- Display the welcome screen ---
echo "============================================================"
echo "      OPEN SOURCE AUDIT — SYSTEM IDENTITY REPORT           "
echo "============================================================"
echo ""
echo "  Student   : $STUDENT_NAME ($REG_NUMBER)"
echo "  Software  : $SOFTWARE_CHOICE (Licensed under GPL v2)"
echo ""
echo "------------------------------------------------------------"
echo "  SYSTEM INFORMATION"
echo "------------------------------------------------------------"
echo "  Distribution  : $DISTRO"
echo "  Kernel Version: $KERNEL"
echo "  Logged-in User: $USER_NAME"
echo "  Home Directory: $HOME_DIR"
echo "  System Uptime : $UPTIME"
echo "  Date & Time   : $CURRENT_DATE"
echo ""
echo "------------------------------------------------------------"
echo "  OPEN SOURCE LICENSE NOTE"
echo "------------------------------------------------------------"
echo "  This operating system (Linux Kernel) is distributed"
echo "  under the GNU General Public License version 2 (GPL v2)."
echo "  This means you are free to use, study, modify, and"
echo "  redistribute it — as long as derivatives remain open."
echo ""
echo "  '$SOFTWARE_CHOICE' is also licensed under GPL v2."
echo "  Source: https://github.com/git/git/blob/master/COPYING"
echo ""
echo "============================================================"
echo "  'Given enough eyeballs, all bugs are shallow.' — ESR     "
echo "============================================================"