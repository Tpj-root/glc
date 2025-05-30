#!/bin/bash
#/*
# * Title: glc
# * Converted and customized by: Tpj-root
# * Based on: "400 Linux Commands with Examples" by Dhanasekar T
# * Published by:
# *   Indian Linux User Group, Chennai – https://ilugc.in/
# *   Kanchi Linux User Group, Kanchipuram – https://kanchilug.wordpress.com/
# * Original Author Email: tkdhanasekar@gmail.com
# * License: CC-BY-SA-NC (https://creativecommons.org/licenses/by-nc-sa/4.0/)
# * Note: This script is a non-commercial adaptation with formatting changes.
# *
# * Copyright (C) 2025 Tpj-root
# * https://github.com/Tpj-root/glc
# *
# * This work is licensed under the Creative Commons Attribution-ShareAlike-NonCommercial 4.0 International License.
# * You may share and adapt this material non-commercially, as long as you give appropriate credit,
# * provide a link to the license, and indicate if changes were made. Any adaptations must be licensed under the same terms.
# * For details, see: https://creativecommons.org/licenses/by-nc-sa/4.0/
# */


## Enabled or Disable
Title_screen=1 # 1 means enabled, 0 means disabled
version=0.0.1

# ┌────────────────────────────────────────────┐
# │             Define colors                  │
# └────────────────────────────────────────────┘
# 
# Define color escape codes
function get_colors() {
    RESET='\033[0m'          # Reset color
    BLACK='\033[30m'         # Black color
    RED='\033[31m'           # Red color
    GREEN='\033[32m'         # Green color
    YELLOW='\033[1;33m'      # Bright Yellow (bold)
    BLUE='\033[34m'          # Blue color
    MAGENTA='\033[35m'       # Magenta color
    CYAN='\033[36m'          # Cyan color
    WHITE='\033[37m'         # White color
    BOLD='\033[1m'           # Bold text
    UNDERLINE='\033[4m'      # Underlined text
    GRAY='\033[90m'          # Gray color
    BRIGHT_RED='\033[91m'    # Bright Red
    BRIGHT_GREEN='\033[92m'  # Bright Green
    BRIGHT_YELLOW='\033[93m' # Bright Yellow
    BRIGHT_BLUE='\033[94m'   # Bright Blue
    BRIGHT_MAGENTA='\033[95m' # Bright Magenta
    BRIGHT_CYAN='\033[96m'   # Bright Cyan
    BRIGHT_WHITE='\033[97m'  # Bright White
    BLINK='\033[5m'          # Blinking text
}


# Initialize color variables by calling the function
get_colors

# Store all color codes in an array for easy random selection
colors=("$RESET" "$BLACK" "$RED" "$GREEN" "$YELLOW" "$BLUE" "$MAGENTA" "$CYAN" "$WHITE" \
        "$BOLD" "$UNDERLINE" "$GRAY" "$BRIGHT_RED" "$BRIGHT_GREEN" "$BRIGHT_YELLOW" \
        "$BRIGHT_BLUE" "$BRIGHT_MAGENTA" "$BRIGHT_CYAN" "$BRIGHT_WHITE")

# Function: print_special_color
# Takes one argument: message string
# Prints the message in a randomly selected color from the 'colors' array
function print_special_color() {
    local message=$1
    # Calculate a random index between 0 and length of colors array - 1
    local rand_index=$(( RANDOM % ${#colors[@]} ))
    # Pick a random color from the colors array using the random index
    local random_color=${colors[$rand_index]}
    # Print the message with the selected color and then reset the color to normal
    echo -e "${random_color}${message}${RESET}"
}

function print_one_color() {
    local message=$1
    # Calculate a random index between 0 and length of colors array - 1
    # local rand_index=$(( RANDOM % ${#colors[@]} ))
    # Pick a random color from the colors array using the random index
    local random_color=${YELLOW}
    # Print the message with the selected color and then reset the color to normal
    echo -e "${random_color}${message}${RESET}"
}


# ┌────────────────────────────────────────────┐
# │             boxfunction                    │
# └────────────────────────────────────────────┘
# 
boxfunction() {
    local msg="$1"
    local padding=2
    local width=$(( ${#msg} + padding * 2 ))

    local top="┌$(printf '─%.0s' $(seq 1 $width))┐"
    local bottom="└$(printf '─%.0s' $(seq 1 $width))┘"
    local line="│$(printf '%*s' $padding '')$msg$(printf '%*s' $padding '')│"

    echo "$top"
    echo "$line"
    echo "$bottom"
}


# ┌────────────────────────────────────────────┐
# │                Title                       │
# └────────────────────────────────────────────┘
# 
function Title() {
  local color_array=("$RED" "$GREEN" "$YELLOW" "$BLUE" "$MAGENTA" "$CYAN" "$BRIGHT_RED" "$BRIGHT_YELLOW" "$BRIGHT_BLUE" "$BRIGHT_MAGENTA" "$BRIGHT_CYAN")
  local rand_index=$((RANDOM % ${#color_array[@]}))
  local COLOR="${color_array[$rand_index]}"
  echo -e "${COLOR}   ____               _     _                   "
  echo -e "  / ___|_ __  _   _  | |   (_)_ __  _   ___  __ "
  echo -e " | |  _| '_ \| | | | | |   | | '_ \| | | \ \/ / "
  echo -e " | |_| | | | | |_| | | |___| | | | | |_| |>  <  "
  echo -e "  \____|_| |_|\__,_| |_____|_|_| |_|\__,_/_/\_\ ${RESET}${COLOR}community${RESET}"
  echo -e "                                       ${COLOR}Version : ${version}   "
  echo -e " Indian Linux User Group, Chennai – https://ilugc.in/"
  echo -e " Kanchi Linux User Group, Kanchipuram – https://kanchilug.wordpress.com/"
  echo -e " Tamil Linux Community - https://forums.tamillinuxcommunity.org/"
  echo -e " Based on: '400 Linux Commands with Examples' by Dhanasekar T ${RESET}"
  echo -e "${BLINK}${BRIGHT_GREEN} "
  echo -e " HACKERSPACES, Trichy - https://wiki.hackerspaces.org/Public_Research_Association_of_Social_Hacktivity"
  echo -e "  (C) 2025  author : 🅂 🅷 🅰 🅳 🅾 🆆${RESET}"
  
}



# print_special_color "Helloworld"

# Function runs only if enabled
printTitle() {
  if [[ "$Title_screen" -eq 1 ]]; then
    #echo "Running prinviewname function..."
    # Add your custom logic here
    Title
  else
    echo "printTitle is disabled."
    clear
  fi
}

printTitle

# ┌────────────────────────────────────────────┐
# │ Function to show help from notes directory │
# └────────────────────────────────────────────┘
_show_help_from() {
  local cmd=$1                   # command name like 'apt-file'
  local folder=$2                # folder name: 'glc' or 'tlc'
  local base_dir="$HOME/Desktop/MY_GIT/glc"   # base project path
  local help_file="${base_dir}/${folder}/${cmd}_notes.txt"

  if [[ -f "$help_file" ]]; then
    # cat "$help_file" | more
    # Add colors with ANSI codes in your file.
    # Use less -R instead of more to see colors in terminal
    #
    tmp_file=$(mktemp)
    sed 's/\\e/\x1b/g' "$help_file" > "$tmp_file"
    less -R "$tmp_file"
    rm "$tmp_file"
  else
    # echo -e "${RED} No help file found for: $cmd"
    # echo -e "${RED} Try: man $cmd"
    #boxfunction "No help file found for: $cmd Try: man $cmd"
    #boxfunction "${RED} No help file found for: $cmd"
    print_one_color "What command page do you want?"
    print_one_color "For example, try 'glc help'."
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
