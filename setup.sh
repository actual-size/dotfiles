#!/usr/bin/env bash

# Install Prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME/.config}/.zprezto"
# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Ensure `brew` is up-to-date
brew update
brew upgrade --all

brew install wget
brew install tree
brew install htop # Process viewer
brew install koekeishiya/formulae/yabai # Tiling window manager
brew install koekeishiya/formulae/skhd # Hotkey daemon
brew install node
brew install yarn

# Install a scripting addition that allows yabai to control the window server
yabai --install-sa
echo "To give yabai the ability to control the window server:
reboot holding ⌘-r and run 'csrutil enable --without debug --without fs' in Terminal"

brew services start yabai
brew services start skhd
killall Dock
