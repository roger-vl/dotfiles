#!/bin/sh
# TEMP diagnostic wrapper for the gh-dash `R` (tuicr) binding.
# Logs environment + tuicr stderr + exit code, and keeps the pane open so it
# never bounces back to the dashboard. Remove once the launch is fixed.
log="$HOME/.cache/tuicr-cr.log"
mkdir -p "$HOME/.cache"
{
  echo "===== $(date) ====="
  echo "pr=$1"
  echo "cwd=$(pwd)"
  echo "TERM=$TERM"
  echo "TMUX=$TMUX"
  echo "SHELL=$SHELL"
  echo "PATH=$PATH"
  echo "tuicr=$(command -v tuicr)"
  echo "gh=$(command -v gh)"
  echo "--- git remote ---"
  git remote -v 2>&1 | head -2
  echo "--- launching: tuicr pr $1 ---"
} >> "$log" 2>&1

# stdout/stdin keep the real pane tty (so the TUI can draw); stderr -> log
tuicr pr "$1" 2>>"$log"
code=$?
echo "[tuicr exit=$code]" >> "$log"

printf '\n[tuicr exited with %s] log: %s\n(press enter to close this pane)\n' "$code" "$log"
IFS= read -r _
