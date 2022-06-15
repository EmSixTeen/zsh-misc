#!/bin/zsh

# Emulate zsh
# ==========
# Putting emulate -LR zsh near the beginning of a function definition is good 
# hygiene when the function is meant to be used in contexts where options are 
# potentially different, especially in interactive shells.
# ( https://unix.stackexchange.com/a/372866 )
emulate -LR zsh

# Go to Site
# - Lets you go directly to the theme folder of a specific Local install 
# - Takes spaced arguments
#   - First argument is sitename, sets themename as sitename too
#   - Second argument is to specify themename
function gts() {
    local dirString="$HOME/Local Sites/"

    # Set up 
    local script="$0"
    local first="$1"
    local second="$2"

    # Echo the parameter variables just for testing
    # echo ""
    # echo "The script name:      $script"
    # echo "The first argument:   $first"
    # echo "The second argument:  $second"
    # echo ""

    # Set up colours
    local Black='\033[0;30m'        # Black
    local Red='\033[0;31m'          # Red
    local Green='\033[0;32m'        # Green
    local Yellow='\033[0;33m'       # Yellow
    local Blue='\033[0;34m'         # Blue
    local Purple='\033[0;35m'       # Purple
    local Cyan='\033[0;36m'         # Cyan
    local White='\033[0;37m'        # White
    local NC='\033[0m'              # No Color

    local arrow="${Cyan}->${NC}"
    local arrowError="${Red}->${NC}"
    local arrowSuccess="${Green}->${NC}"
    
    echo ""

    if [[ ! -z "$first" ]]; then
        
        # Take the first parameter passed and add it to the path
        dirString+="$first/"
        # Add the path Local by Flywheel uses for the WordPress root
        dirString+="app/public/"
        # Add the path to the theme folder
        dirString+="wp-content/themes/"

        # Set an empty local variable to hold the theme name
        local theme=""

        if [[ ! -z "$second" ]]; then
            echo "$arrowSuccess ${Yellow}Second${NC} parameter passed"
            echo "$arrow Setting theme folder to $second:"

            theme="$second"
            dirString+="$theme/"

            echo "   $dirString"
        else
            echo "$arrowSuccess Single parameter passed"
            echo "$arrow Presuming theme folder is same name as site name:"

            theme="$first"
            dirString+="$theme/"

            echo "   $dirString"
        fi

    else 
        echo "$arrow No parameters passed"
    fi

    # Check that the directory we want to change to actually exists
    if [ ! -d "$dirString" ]; then
        echo "$arrowError ${Red}Error:${NC} That folder doesn't exist, check your parameters"
    elif [ -d "$dirString" ]; then
        echo "$arrowSuccess Folder exists, changing to it"
        cd "$dirString"
    fi

    echo ""

}
