#!/bin/bash
# =============================================================
# Script 3: Disk and Permission Auditor
# Author: Riddhi Sharma | Reg: 24BAI10674
# Course: Open Source Software | Chosen Software: Git
# Description: Loops through important system directories and
#              reports disk usage, owner, and permissions.
#              Also checks Git's config files.
# NOTE: Adapted for JDoodle — some dirs may show limited info
# =============================================================

# --- List of important system directories to audit ---
DIRS=("/etc" "/var" "/home" "/usr/bin" "/tmp")

echo "============================================================"
echo "           DISK AND PERMISSION AUDITOR                     "
echo "============================================================"
echo ""
echo "  Why permissions matter in open source:"
echo "  Open-source software must run securely on shared systems."
echo "  Knowing WHO owns a directory and WHAT they can do"
echo "  prevents privilege escalation and unauthorized changes."
echo ""
echo "------------------------------------------------------------"
printf "  %-15s %-10s %-30s\n" "Directory" "Size" "Perms / Owner / Group"
echo "------------------------------------------------------------"

# --- For loop: iterate over each directory in the array ---
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # Extract permissions, owner, group using ls and awk
        PERMS=$(ls -ld "$DIR" 2>/dev/null | awk '{print $1, $3, $4}')

        # Get human-readable size, suppress permission errors
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # If size is empty due to restrictions, show N/A
        [ -z "$SIZE" ] && SIZE="N/A"

        printf "  %-15s %-10s %-30s\n" "$DIR" "$SIZE" "$PERMS"
    else
        printf "  %-15s %-40s\n" "$DIR" "[does not exist]"
    fi
done

echo ""
echo "------------------------------------------------------------"
echo "  GIT-SPECIFIC DIRECTORY CHECK                             "
echo "------------------------------------------------------------"
echo ""

# --- Check for Git global config file ---
GIT_CONFIG="$HOME/.gitconfig"
if [ -f "$GIT_CONFIG" ]; then
    echo "  [✔] Git global config : $GIT_CONFIG"
    PERMS=$(ls -l "$GIT_CONFIG" | awk '{print $1, $3, $4}')
    echo "      Permissions        : $PERMS"
else
    echo "  [!] No ~/.gitconfig found (not configured yet)"
    echo "      On a real system run: git config --global user.name 'Your Name'"
fi

echo ""

# --- Check for Git binary location ---
GIT_BIN=$(which git 2>/dev/null)
if [ -n "$GIT_BIN" ]; then
    echo "  [✔] Git binary location: $GIT_BIN"
    PERMS=$(ls -l "$GIT_BIN" | awk '{print $1, $3, $4}')
    echo "      Permissions        : $PERMS"
else
    echo "  [✗] Git binary not found in PATH"
fi

echo ""
echo "------------------------------------------------------------"
echo "  SECURITY NOTE"
echo "------------------------------------------------------------"
echo "  Git config files should only be writable by their owner."
echo "  If ~/.gitconfig is world-writable, anyone could alter"
echo "  your commit identity — a serious risk in open-source"
echo "  contributions where trust and authorship matter."
echo ""
echo "============================================================"