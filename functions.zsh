# Functions
# =========

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

# Change to the Local Sites folder
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
