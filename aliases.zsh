#!/bin/zsh

# Emulate zsh
# ==========
# Putting emulate -LR zsh near the beginning of a function definition is good 
# hygiene when the function is meant to be used in contexts where options are 
# potentially different, especially in interactive shells.
# ( https://unix.stackexchange.com/a/372866 )
emulate -LR zsh

# Aliases
# =======