#!/bin/bash

# define editor
# EDITOR_CMD="micro"
# EDITOR_CMD="nano"
EDITOR_CMD="nvim"

# Allows the user to set their favorite editor (default is nano)
EDITOR_CMD="${EDITOR_CMD:-nano}"

# nvv function - search files and open in user editor
nvv() {
    local file
    file=$(find "$HOME" -type f \( -name ".*" -o -name "*" \) 2>/dev/null \
        | fzf --exact --prompt="Enter file pattern: " \
              --bind "alt-f:change-query('')" --info=inline --reverse)
    
    if [[ -n "$file" ]]; then
        "$EDITOR_CMD" "$file"
    fi
}

# cdd function - search directories and go to the selected one
cdd() {
    local dir
    dir=$(find "$HOME" -type d \( -name ".*" -o -name "*" \) 2>/dev/null \
        | fzf --exact --prompt="Enter directory template: " \
              --preview 'ls -la {}' \
              --bind "alt-h:execute(cd ~ && bash)" \
              --bind "alt-f:change-query('')" \
              --info=inline --reverse)
    
    if [[ -n "$dir" ]]; then
        clear
        cd "$dir"
        pwd
    fi
}

# fdd function - search for directories and display their tree (1 level of nesting)
fdd() {
    local dir
    dir=$(find "$HOME" -type d \( -name ".*" -o -name "*" \) 2>/dev/null \
        | fzf --exact --prompt="Enter directory template: " \
              --preview 'ls -la {}' \
              --bind "alt-h:execute(cd ~ && bash)" \
              --bind "alt-f:change-query('')" \
              --info=inline --reverse)
    
    if [[ -n "$dir" ]]; then
        tree -L 1 "$dir"
    fi
}

# Export functions to work in terminal
export -f mcc
export -f cdd

