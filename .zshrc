alias ll='ls -alFG'
alias cls='clear'
alias g='git'
alias gst='git status'
alias gcb='git checkout -b'
alias gpl='git pull'
alias gps='git push'
alias gcm='git commit -m'

setopt auto_cd
 
# mkcd: Creates a new directory and immediately changes into it.
# Usage: mkcd <directory_name>
function mkcd() {
  # Check if a directory name was provided
  if [ -z "$1" ]; then
    echo "Usage: mkcd <directory_name>"
    return 1 # Exit with an error status
  fi
 
  # Create the directory
  mkdir "$1"
 
  # Check if mkdir was successful before attempting to change directory
  if [ $? -eq 0 ]; then
    cd "$1"
  else
    echo "Failed to create directory '$1'."
    return 1 # Exit with an error status
  fi
}
