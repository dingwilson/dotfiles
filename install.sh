#!/bin/sh

echo "Setting up your Mac..."

# XCode Command Line Tools

if ! xcode-select --print-path &> /dev/null; then

  # Prompt user to install the XCode Command Line Tools
  xcode-select --install &> /dev/null

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Wait until the XCode Command Line Tools are installed
  until xcode-select --print-path &> /dev/null; do
    sleep 5
  done

  print_result $? 'Install XCode Command Line Tools'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Point the `xcode-select` developer directory to
  # the appropriate directory from within `Xcode.app`
  # https://github.com/alrra/dotfiles/issues/13

  sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
  print_result $? 'Make "xcode-select" developer directory point to Xcode'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Prompt user to agree to the terms of the Xcode license
  # https://github.com/alrra/dotfiles/issues/10

  sudo xcodebuild -license
  print_result $? 'Agree with the XCode Command Line Tools licence'

fi

# Moving dotfiles into ~
files="bash_profile zshrc vimrc gitconfig aliases gitignore"
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

# Make ZSH the default shell environment
chsh -s $(which zsh)

# Updating all ruby gems
ech "Updating all gems.."
sudo gem update

# Install Cocoapods
echo "Installing Cocoapods."
sudo gem install cocoapods

# Setup Various MacOS preferences
echo "Setting Up Various MacOS Preferences..."
source .macos
