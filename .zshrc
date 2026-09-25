# Aliases
alias ll='ls -alFG'
alias cls='clear'
alias g='git'
alias gst='git status'
alias gcb='git checkout -b'
alias gpl='git pull'
alias gps='git push'
alias gcm='git commit -m'
alias gc='git clone'
alias gchmain='git checkout main; git pull'
alias ga='git add'
alias gch='git checkout' 

# Automatically cd's into a directory if just type directory name omitting the cd
# If command is the same name as directory, command takes preference
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

# gccd: Clones repository and immediately changes into it
# Usage: gccd <repo>
function gccd() {
    git clone "$1" || return
    cd "$(basename "$1" .git)"
}

# syncupstream: Syncs forked repo with  upstream repo
function syncupstream() {
    git fetch upstream
    git checkout main
    git merge --ff-only upstream/main
    git push origin main
}

function git-clean-merged() {
  git fetch --prune
  git branch --merged origin/main | grep -v -E "^\*|main" | xargs -r git branch -d
}
alias gclean='git-clean-merged'



# Prompt before user types 
PROMPT="%F{blue}%B%~%b%f %F{green}>%f "
