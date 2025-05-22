#!/bin/bash

# ┌────────────────────────────────────────────┐
# │ Function to show help from notes directory │
# └────────────────────────────────────────────┘
_show_help_from() {
  local cmd=$1                   # command name like 'apt-file'
  local folder=$2                # folder name: 'glc' or 'tlc'
  local base_dir="$HOME/Desktop/MY_GIT/glc"   # base project path
  local help_file="${base_dir}/${folder}/${cmd}_notes.txt"

  if [[ -f "$help_file" ]]; then
    cat "$help_file" | more
  else
    echo "No help file found for: $cmd"
    echo "Try: man $cmd"
  fi
}

# ┌────────────────────────────┐
# │ User-facing wrapper funcs  │
# └────────────────────────────┘
glc() {
  _show_help_from "$1" "glc"
}

tlc() {
  _show_help_from "$1" "tlc"
}

# ┌────────────────────────────────────────────────┐
# │ Tab-completion function for GLC (global help)  │
# └────────────────────────────────────────────────┘
_glc_complete() {
  local dir="$HOME/Desktop/MY_GIT/glc/glc"
  # Get all *_notes.txt files, strip suffix
  local entries=$(cd "$dir" && ls *_notes.txt 2>/dev/null | sed 's/_notes\.txt$//')
  COMPREPLY=($(compgen -W "$entries" -- "${COMP_WORDS[1]}"))
}

# ┌────────────────────────────────────────────────┐
# │ Tab-completion function for TLC (tool help)    │
# └────────────────────────────────────────────────┘
_tlc_complete() {
  local dir="$HOME/Desktop/MY_GIT/glc/tlc"
  local entries=$(cd "$dir" && ls *_notes.txt 2>/dev/null | sed 's/_notes\.txt$//')
  COMPREPLY=($(compgen -W "$entries" -- "${COMP_WORDS[1]}"))
}

# ┌─────────────────────┐
# │ Enable tab-complete │
# └─────────────────────┘
complete -F _glc_complete glc
complete -F _tlc_complete tlc
