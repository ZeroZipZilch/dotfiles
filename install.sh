#!/bin/bash

# Get dotfile directory
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# homebrew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/instl.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/mohammadel/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew bundle --file ${BASEDIR}/Brewfile

# Update submodules
git submodule update --init --remote

# vim
ln -fs ${BASEDIR}/vimrc ~/.vimrc

# zsh
ln -fs ${BASEDIR}/zshrc ~/.zshrc
ln -fs ${BASEDIR}/oh-my-zsh ~/.oh-my-zsh

# git
ln -fs ${BASEDIR}/gitconfig ~/.gitconfig
ln -fs ${BASEDIR}/gitignore ~/.gitignore 

# tmux
ln -fs ${BASEDIR}/tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Kitty
ln -fs ${BASEDIR}/kitty ~/.config/

# Pure Prompt
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

# NPM global scripts
npm i -g trash-cli
