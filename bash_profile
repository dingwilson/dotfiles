# Homebrew PATH config
export PATH=/usr/local/bin:$PATH

# Quote of the Day
curl --silent http://www.brainyquote.com/quotes_of_the_day.html | grep bqPhotoDefault | sed -n '1p;' | sed -n 's/.*alt="\([^"]*\).*/\1/p' | sed 's/&#39;//' | sed 's/&#34;//'

# Git Aliases
alias gi="git init"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push origin"

# CD Aliases
alias cdsd="cd '/Volumes/ExtDrive SD'"
alias cdhd="cd '/Volumes/Macintosh HD'"

# Website Aliases
alias fb="open https://www.facebook.com"
alias gh="open https://github.com/dingwilson"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Show/hide hidden files in Finder
alias showfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"