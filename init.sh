#!/bin/bash

cp /etc/skel/.bashrc ~

git config --global user.name "Mason Blalock"
git config --global user.email "15042748+blalockma@users.noreply.github.com"

script_directory=$(dirname $(realpath $0))
rm -rf ~/bashrc_extensions
cp -r $script_directory/configs/bashrc_extensions ~/bashrc_extensions

# Install zsh
sudo apt update
sudo apt install zsh
chsh -s $(which zsh)

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

shopt -s dotglob
for file in $script_directory/configs/*; do
	if [ ! -d "$file" ]; then
		cp $file ~
	fi
done

rm -f ~/.zshrc.pre-oh-my-zsh
rm -f ~/.shell.pre-oh-my-zsh
sudo rm ~/.zcompdump*
