#!/bin/bash

echo install xcode cli tools
xcode-select --install

echo Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" NONINTERACTIVE=1

echo adding brew to the zsh path
echo -n 'export PATH=/opt/homebrew/bin/' >> ~/.zshrc

echo source new path
source ~/.zshrc

echo install Formulaes
brew install --formulae fzf go luarocks nvm ripgrep powerlevel10k ruby zig zoxide zsh-syntax-highlighting

echo install Neovim Nightly
brew install --formulae neovim --HEAD

echo install Casks
brew install alfred appcleaner betterdisplay cheatsheet github iterm2@nightly linearmouse

echo Write zshconfig
echo -n 'if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]] then' >> ~/.zshrc
echo -n 'source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh' >> ~/.zshrc
echo -n 'fi' >> ~/.zshrc

