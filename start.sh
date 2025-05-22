#!/bin/bash

# Get current script directory (assumes start.sh and main.sh are in the same folder)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_LINE="source \"$SCRIPT_DIR/main.sh\""

# Check if the line already exists in .bashrc
if grep -Fxq "$SOURCE_LINE" "$HOME/.bashrc"; then
  echo "[✔] Already added to .bashrc"
else
  echo "$SOURCE_LINE" >> "$HOME/.bashrc"
  echo "[+] Added to .bashrc"
fi

# Optional: Reload bashrc immediately
echo "[i] To apply changes now, run: source ~/.bashrc"
