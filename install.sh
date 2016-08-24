#!/bin/sh

echo "Setting up your Mac..."

# Moving dotfiles into ~
files="bash_profile gitconfig"
dir=~/dotfiles

for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
echo "Updating Homebrew."
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Install Cocoapods
echo "Installing Cocoapods."
sudo gem install cocoapods