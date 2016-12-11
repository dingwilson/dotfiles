#!/bin/sh

echo "Setting up your Mac..."

# Moving dotfiles into ~
files="bash_profile zshrc gitconfig aliases gitignore"
dir=~/dotfiles

for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# Set ~/.gitignore as global .gitignore
git config --global core.excludesfile ~/.gitignore
echo "Set up your global .gitignore at ~/.gitignore"

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo "Installed Homebrew"
fi

# Update Homebrew recipes
echo "Updating Homebrew."
brew update

# Install all our dependencies with bundle (See Brewfile)
echo "Tapping Homebrew Bundle"
brew tap homebrew/bundle
echo "Brewing bundle."
brew bundle

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Updating all ruby gems
ech "Updating all gems.."
sudo gem update

# Install Cocoapods
echo "Installing Cocoapods."
sudo gem install cocoapods

# Setup Various MacOS preferences
echo "Setting Up Various MacOS Preferences..."
sh macos.sh
