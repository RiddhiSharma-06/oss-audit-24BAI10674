#!/bin/bash
# =============================================================
# Script 4: Log File Analyzer
# Author: Riddhi Sharma | Reg: 24BAI10674
# Course: Open Source Software | Chosen Software: Git
# Description: Creates a sample log file, reads it line by
#              line, counts keyword occurrences, and prints
#              a summary with the last 5 matching lines.
# NOTE: Adapted for JDoodle — generates a sample log file
#       since /var/log files don't exist in the sandbox
# =============================================================

# --- JDoodle Adaptation: Create a sample log file ---
SAMPLE_LOG="/tmp/sample_git_activity.log"

cat > "$SAMPLE_LOG" << 'EOF'
2025-03-01 10:12:01 INFO  Git daemon started on port 9418
2025-03-01 10:15:22 INFO  Clone request received from 192.168.1.10
2025-03-01 10:15:23 INFO  Repository transfer complete: 245 objects
2025-03-01 10:20:44 ERROR Authentication failed for user: jdoe
2025-03-01 10:21:05 WARNING Repo size exceeds recommended limit (500MB)
2025-03-01 10:35:10 INFO  Push received: branch=main refs=3
2025-03-01 10:40:18 ERROR Merge conflict detected in file: src/main.c
2025-03-01 10:41:00 INFO  Conflict resolved by user: admin
2025-03-01 11:00:05 WARNING Slow network detected — transfer rate 12 KB/s
2025-03-01 11:05:33 ERROR Permission denied: user 'guest' cannot push to main
2025-03-01 11:10:44 INFO  Hook script executed: pre-receive
2025-03-01 11:15:55 ERROR Invalid object SHA: 3f4a9bc1 — possible corruption
2025-03-01 11:20:01 INFO  Backup completed: 12 repositories archived
2025-03-01 11:25:30 WARNING Disk usage at 85% on /var/git/repos
2025-03-01 11:30:00 ERROR Failed to acquire lock: .git/index.lock exists
EOF

echo "============================================================"
echo "              LOG FILE ANALYZER                            "
echo "============================================================"
echo ""
echo "  [Note] Sample log generated at: $SAMPLE_LOG"
echo "  On a real Linux system you would run:"
echo "  ./script4.sh /var/log/syslog error"
echo ""

# --- Set the log file and keyword ---
LOGFILE="$SAMPLE_LOG"
KEYWORD="error"

# --- Counter variable ---
COUNT=0

# --- Retry loop: check up to 3 times if file is missing or empty ---
ATTEMPT=0
MAX_ATTEMPTS=3

while [ $ATTEMPT -lt $MAX_ATTEMPTS ]; do
    ATTEMPT=$((ATTEMPT + 1))

    if [ ! -f "$LOGFILE" ]; then
        echo "  [!] Attempt $ATTEMPT/$MAX_ATTEMPTS: File not found."
        sleep 1
    elif [ ! -s "$LOGFILE" ]; then
        echo "  [!] Attempt $ATTEMPT/$MAX_ATTEMPTS: File is empty."
        sleep 1
    else
        echo "  [✔] Log file confirmed: $LOGFILE"
        break
    fi

    if [ $ATTEMPT -eq $MAX_ATTEMPTS ]; then
        echo "  [✗] Could not access log file. Exiting."
        exit 1
    fi
done

echo "  [✔] Keyword to search: '$KEYWORD'"
echo ""

# --- Read file line by line using while-read loop ---
while IFS= read -r LINE; do
    # Check each line for keyword match (case-insensitive)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # Increment counter on match
    fi
done < "$LOGFILE"

# --- Print summary ---
echo "------------------------------------------------------------"
echo "  ANALYSIS SUMMARY"
echo "------------------------------------------------------------"
echo "  Log file    : $LOGFILE"
echo "  Keyword     : '$KEYWORD'"
echo "  Total lines : $(wc -l < $LOGFILE)"
echo "  Matches     : $COUNT lines contain '$KEYWORD'"
echo ""

# --- Show last 5 matching lines ---
if [ $COUNT -gt 0 ]; then
    echo "------------------------------------------------------------"
    echo "  LAST 5 MATCHING LINES"
    echo "------------------------------------------------------------"
    grep -i "$KEYWORD" "$LOGFILE" | tail -5 | while IFS= read -r MATCH; do
        echo "  >> $MATCH"
    done
else
    echo "  No lines matching '$KEYWORD' were found."
fi

echo ""
echo "------------------------------------------------------------"
echo "  WHY LOG ANALYSIS MATTERS IN OPEN SOURCE"
echo "------------------------------------------------------------"
echo "  Git relies on logs to surface errors during hooks and"
echo "  CI/CD pipelines. Transparency in logging is a core"
echo "  open-source value — unlike proprietary tools that hide"
echo "  failure details from the user."
echo ""
echo "============================================================"