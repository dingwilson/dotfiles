#!/usr/bin/env bash

# Moving dotfiles into ~
files="bash_profile zshrc vimrc gitconfig aliases gitignore"
dir=~/dotfiles

for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/dotfiles/$file ~/.$file
done

# Set ~/.gitignore as global .gitignore
git config --global core.excludesfile ~/.gitignore
echo "Set up your global .gitignore at ~/.gitignore"

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo "Installed Homebrew"
fi

# Turn off Homebrew Analytics
echo "Turning off Homebrew Analytics/Tracking"
brew analytics off

# Update Homebrew recipes
echo "Updating Homebrew."
brew update

# Install all our dependencies with bundle (See Brewfile)
echo "Tapping Homebrew Bundle"
brew tap homebrew/bundle
echo "Brewing bundle."
brew bundle

# Install Oh-My-Zsh
echo "Installing Oh-My-Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Make ZSH the default shell environment
echo "Switching to Zsh as Default Shell Environment"
chsh -s $(which zsh)

# Updating all ruby gems
echo "Updating all gems.."
sudo gem update

# Check for Cocoapods and install if we don't have it
if test ! $(which pod); then
  echo "Installing Cocoapods."
  sudo gem install cocoapods
fi
