#!/bin/bash
# =============================================================
# Script 2: FOSS Package Inspector
# Author: Riddhi Sharma | Reg: 24BAI10674
# Course: Open Source Software | Chosen Software: Git
# Description: Simulates checking whether Git is installed,
#              shows version info, and prints philosophy notes
#              using a case statement.
# NOTE: Adapted for JDoodle — rpm/dpkg replaced with 'which'
#       and 'git --version' since JDoodle has no package manager
# =============================================================

# --- The package we are auditing ---
PACKAGE="git"

echo "============================================================"
echo "              FOSS PACKAGE INSPECTOR                       "
echo "============================================================"
echo ""

# --- Check if git binary exists using 'which' ---
if which "$PACKAGE" &>/dev/null; then
    echo "[✔] '$PACKAGE' is INSTALLED on this system."
    echo ""
    echo "--- Package Details ---"

    # Get the version directly from git itself
    GIT_VERSION=$(git --version 2>/dev/null)
    echo "  Version : $GIT_VERSION"

    # Show where the binary is located
    GIT_PATH=$(which git)
    echo "  Binary  : $GIT_PATH"

    # Show the exec path where git stores its sub-commands
    GIT_EXEC=$(git --exec-path 2>/dev/null)
    echo "  Exec    : $GIT_EXEC"

    # License info hardcoded since dpkg/rpm unavailable in JDoodle
    echo "  License : GPL v2"
    echo "  Summary : Fast, scalable, distributed version control system"
    echo "  URL     : https://git-scm.com"

else
    echo "[✗] '$PACKAGE' is NOT installed or not found in PATH."
    echo ""
    echo "  To install on Ubuntu/Debian : sudo apt install git"
    echo "  To install on Fedora/RHEL   : sudo dnf install git"
fi

echo ""
echo "============================================================"
echo "  OPEN SOURCE PHILOSOPHY NOTES                             "
echo "============================================================"
echo ""

# --- Case statement: print philosophy note based on package name ---
case "$PACKAGE" in
    git)
        echo "[$PACKAGE] Git was born from frustration."
        echo "  Linus Torvalds built it in 2005 after BitKeeper — the"
        echo "  proprietary VCS used by Linux kernel devs — revoked its"
        echo "  free license. He wrote Git in about 10 days and open-"
        echo "  sourced it immediately under GPL v2. Today it powers"
        echo "  virtually all software development on the planet."
        ;;
    httpd | apache2)
        echo "[$PACKAGE] Apache: the web server that built the open internet."
        echo "  Licensed under Apache 2.0 — allows commercial use without"
        echo "  requiring source code disclosure."
        ;;
    mysql | mariadb)
        echo "[$PACKAGE] MySQL: open source at the heart of millions of apps."
        echo "  Uses dual-licensing — GPL v2 for open source use, commercial"
        echo "  license for proprietary products."
        ;;
    firefox)
        echo "[$PACKAGE] Firefox: a nonprofit's fight for an open web."
        echo "  Backed by Mozilla Foundation. Licensed under MPL 2.0."
        ;;
    vlc)
        echo "[$PACKAGE] VLC: built by students, plays everything."
        echo "  Created at École Centrale Paris. Licensed under LGPL/GPL."
        ;;
    python3 | python)
        echo "[$PACKAGE] Python: a language shaped entirely by community."
        echo "  Uses PSF License — permissive and GPL-compatible."
        ;;
    *)
        echo "[$PACKAGE] An open-source tool in the free software ecosystem."
        ;;
esac

echo ""
echo "============================================================"