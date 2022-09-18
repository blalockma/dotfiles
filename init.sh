#!/bin/bash

cp /etc/skel/.bashrc ~
rm -rf ~/bashrc_extensions

script_directory=$(dirname $(realpath $0))
cp -r $script_directory/configs/bashrc_extensions ~/bashrc_extensions

shopt -s dotglob
for file in $script_directory/configs/*; do
	if [ ! -d "$file" ]; then
		cp $file ~
	fi
done

echo -e "\n\n# CUSTOM SECTION FROM git:masonblalock/dotfiles\n" >> ~/.bashrc
echo "shopt -s dotglob" >> ~/.bashrc
echo "for file in ~/bashrc_extensions/*; do" >> ~/.bashrc
echo "	source \$file" >> ~/.bashrc
echo "done" >> ~/.bashrc

# Install oh-my-zsh
