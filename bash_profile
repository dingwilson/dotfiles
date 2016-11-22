# Homebrew PATH config
export PATH=/usr/local/bin:$PATH

# Quote of the Day
curl --silent http://www.brainyquote.com/quotes_of_the_day.html | grep bqPhotoDefault | sed -n '1p;' | sed -n 's/.*alt="\([^"]*\).*/\1/p' | sed 's/&#39;//' | sed 's/&#34;//'

# Map vi to vim
alias vi="vim"

# Git Aliases
alias gi="git init"
alias ga="git add ."
alias gc="git commit -m"
alias gpm="git push origin master"
alias gpd="git push origin develop"
alias gpp="git push origin gh-pages"
alias grao="git remote add origin"
alias goops="git fetch --all&&git reset --hard origin/master"

createGithubRepo() {
	CURRENTDIR=${PWD##*/}
	GITHUBUSER=$(git config github.user)

	read "REPONAME?New repo name (enter for ${PWD##*/}):"
	read "USER?Git Username (enter for ${GITHUBUSER}):"
	read "DESCRIPTION?Repo Description:"
	read "PRIVATE?Private Repository?(true/false):"

	echo "Creating Github Repository..."

	curl -u ${USER:-${GITHUBUSER}} https://api.github.com/user/repos -d "{\"name\": \"${REPONAME:-${CURRENTDIR}}\", \"description\": \"${DESCRIPTION}\", \"private\": \"${PRIVATE}\"}"

	git remote add origin git@github.com:${USER:-${GITHUBUSER}}/${REPONAME:-${CURRENTDIR}}.git
}

alias ghc=createGithubRepo

# CD Aliases
alias cdsd="cd '/Volumes/ExtDrive SD'"
alias cdhd="cd '/Volumes/Macintosh HD'"

# Website Aliases
alias fb="open https://www.facebook.com"
alias gh="open https://github.com/dingwilson"

# Homebrew Aliases
alias bu="brew update && brew upgrade && brew cleanup"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete; rm -rf ~/Documents/ViberDownloads/"

# Show/hide hidden files in Finder
alias showfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
