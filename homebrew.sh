#!/bin/bash

echo install xcode cli tools
xcode-select --install

echo Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" NONINTERACTIVE=1

echo adding brew to the zsh path
echo (eval "$(/opt/homebrew/bin/brew shellenv)") >> ~/.zprofile
echo "TODO: Hier muss ich noch mal ran! Das passt noch nicht! Da fehlt noch was."

echo install Formulaes
brew install --formulae chezmoi bat cmake composer curl eza fd fzf go lua luajit luarocks mas neovim ninja nvm php powerlevel10k python ripgrep thefuck yt-dlp zig zoxide zsh-autosuggestions zsh-syntax-highlighting

echo install Casks
brew install --cask alacritty alt-tab font-meslo-for-powerlevel10k appcleaner betterdisplay cheatsheet github linearmouse arc steam anydesk command-x raycast

echo write .zsrc file and rename old one
mv ~/.zshrc ~/.zshrc.old
curl https://raw.githubusercontent.com/jayzone91/dotfiles/main/.zshrc -o ~/.zshrc

echo write powerlevel10k file
curl https://raw.githubusercontent.com/jayzone91/dotfiles/main/.p10k.zsh -o ~/.p10k.zsh

echo write alacritty config
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
curl https://raw.githubusercontent.com/jayzone91/dotfiles/main/.config/alacritty/alacritty.toml -o ~/.config/alacritty/alacritty.toml

echo write neovim config
git clone https://github.com/jayzone91/nvim ~/.config/nvim/

echo source zsrc
source ~/.zshrc

echo install node lts
nvm install --lts
nvm use --lts
