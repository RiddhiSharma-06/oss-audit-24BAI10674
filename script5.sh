#!/bin/bash
# =============================================================
# Script 5: Open Source Manifesto Generator
# Author: Riddhi Sharma | Reg: 24BAI10674
# Course: Open Source Software | Chosen Software: Git
# Description: Takes three answers and generates a personalised
#              open-source philosophy statement, saved to a file.
# NOTE: Adapted for JDoodle — 'read' prompts replaced with
#       pre-filled variables. Change them to YOUR own answers!
# =============================================================

# --- Alias concept (demonstrated via comment) ---
# In a real shell session you could define:
#   alias manifesto='./script5_manifesto.sh'
# Git itself uses aliases heavily — e.g. 'git co' for checkout
# defined in ~/.gitconfig under the [alias] section.

echo "============================================================"
echo "       OPEN SOURCE MANIFESTO GENERATOR                     "
echo "============================================================"
echo ""
echo "  Answer three questions to generate your manifesto."
echo "  [JDoodle Note: answers are pre-filled below —"
echo "   change them to your own before running!]"
echo ""

# =============================================================
# CHANGE THESE THREE VALUES TO YOUR OWN ANSWERS:
# On a real Linux terminal these would be interactive prompts:
#   read -p "1. Name one open-source tool you use every day: " TOOL
#   read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
#   read -p "3. Name one thing you would build and share freely: " BUILD
# =============================================================
TOOL="Git"
FREEDOM="choice"
BUILD="a study planner app"

# --- Simulate displaying the questions and answers ---
echo "  1. Name one open-source tool you use every day:"
echo "     >> $TOOL"
echo ""
echo "  2. In one word, what does 'freedom' mean to you?"
echo "     >> $FREEDOM"
echo ""
echo "  3. Name one thing you would build and share freely:"
echo "     >> $BUILD"
echo ""

# --- Get today's date using the date command ---
DATE=$(date '+%d %B %Y')

# --- Output filename using current username ---
OUTPUT="/tmp/manifesto_$(whoami).txt"

echo "------------------------------------------------------------"
echo "  Generating your manifesto..."
echo "------------------------------------------------------------"
echo ""

# --- Clear the file first, then build it line by line ---
> "$OUTPUT"

# --- Write header to file using >> (append) ---
echo "============================================================" >> "$OUTPUT"
echo "           MY OPEN SOURCE MANIFESTO                        " >> "$OUTPUT"
echo "  Generated on : $DATE                                     " >> "$OUTPUT"
echo "  By           : $(whoami)                                 " >> "$OUTPUT"
echo "  Course       : Open Source Software                      " >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# --- Write personalised paragraph using string concatenation ---
echo "  Every day, I rely on $TOOL — a piece of software that    " >> "$OUTPUT"
echo "  someone chose to build in the open and share freely.     " >> "$OUTPUT"
echo "  To me, freedom means $FREEDOM. Not just freedom from     " >> "$OUTPUT"
echo "  cost, but freedom to read the code, change it, learn     " >> "$OUTPUT"
echo "  from it, and pass it on.                                 " >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  Open source taught me that knowledge grows when shared.  " >> "$OUTPUT"
echo "  Linus Torvalds didn't just build Git — he showed that    " >> "$OUTPUT"
echo "  the best tools are built by communities, not corporations." >> "$OUTPUT"
echo "  That philosophy shapes how I want to build too.          " >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  One day, I want to build $BUILD and release it freely —  " >> "$OUTPUT"
echo "  not because I have to, but because that is what it means " >> "$OUTPUT"
echo "  to stand on the shoulders of giants and give something   " >> "$OUTPUT"
echo "  back. Software is not just code. It is a statement about " >> "$OUTPUT"
echo "  how knowledge should move in the world.                  " >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  I believe in open source — not as a license model, but   " >> "$OUTPUT"
echo "  as a commitment to transparency, collaboration, and the  " >> "$OUTPUT"
echo "  idea that the best tools are always built together.      " >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  — $(whoami), $DATE                                       " >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"

# --- Confirm file was saved ---
echo "  [✔] Manifesto saved to: $OUTPUT"
echo ""
echo "------------------------------------------------------------"
echo "  YOUR MANIFESTO:"
echo "------------------------------------------------------------"
echo ""

# --- Display the saved file using cat ---
cat "$OUTPUT"

echo ""
echo "============================================================"
echo "  'Free software is a matter of liberty, not price.'       "
echo "  — Richard Stallman, GNU Project                          "
echo "============================================================"