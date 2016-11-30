# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/wilson/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=()

source $ZSH/oh-my-zsh.sh

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Quote of the Day
curl --silent http://www.brainyquote.com/quotes_of_the_day.html | grep bqPhotoDefault | sed -n '1p;' | sed -n 's/.*alt="\([^"]*\).*/\1/p' | sed 's/&#39;//' | sed 's/&#34;//'

# Replace Vi with Vim
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

# Show/hide hidden files in Finder
alias showfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidefiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# XCode Remove Derived Data
alias xcdd='rm -rf ~/Library/Developer/Xcode/DerivedData/*'

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete; rm -rf ~/Documents/ViberDownloads/"
