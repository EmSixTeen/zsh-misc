#!/bin/zsh

# Emulate zsh
# ==========
# Putting emulate -LR zsh near the beginning of a function definition is good 
# hygiene when the function is meant to be used in contexts where options are 
# potentially different, especially in interactive shells.
# ( https://unix.stackexchange.com/a/372866 )
emulate -LR zsh

# Functions
# =========
source "./functions/go-to-site.zsh"

## Reload ZSH
function reload() {
    exec zsh
}

## Change to a directory and then show the files in it
function cdl() {
    cd $1 && ls
    alias cdls="cdl"
}

## Make directory & enter it
function mkcd() {
    mkdir -p $1
    cd $1
}

## Edit your hosts file
function edithosts() {
    sudo vim /etc/hosts
}

# Remove spaces from files
# ! Won't warn on replacing existing files
function removespaces() {
    for name in *; 
    do mv "$name" "${name// /_}"; 
    done
}