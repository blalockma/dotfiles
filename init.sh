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

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDCc7TXg6mf5o4Xm0gyGESTZfCndENu8RyVdJJ8vCKnwuNQspCRm+Q+7dYF+KPhOPzXg7cSYjdf4ETKOCug6SfxTPKjy6bhm4XvZJWImD6Dtnw2b/HAqnY4huvFunigkKwVClpHE6GSobmlpytT+g/AUQ5K9WSQOQ180L4ipIyoAffxaWuWkMR8nWLkhvjbyuQwyxBgxR/vuY3ZPArUJl5SGAzoI2lwVfebqbFrYhUvyN9pU3kng1JsuaGo9OKN8x0sYn4g+HCQM7W6ilk7M4Md8e1jzDkFqQiN/Lbe+gA9PYAp+pNr79SaZWap7BE19L1hXMajwB0enRaga1iC7Eo2wb4YkaKTzWWGLPSY8/fin5XaV90wH93LVDv+OLLUrLRgvwbcHFzF6rxUwlFL1WeYmBPLQmY7trcT5tC1CHp0HKP7+gXTuh32hWV+mgVYlZca+sajzUhe6am7FmcsBQ83facxM+9D084AzeUsUzbhCjmpnmBxdznJRepTyNRuLz10NH3xjVyvKlHU/qUKzEO+c7rHnHWuJAgE6uy89T4t+LzX2A3qab1rYJ//81DPQrLOPrS2rHEaQPKcw8h5/UUkXzLXZDe7NooyaxgSllv0q4WBT+aHHC+5gv2m0CWRcMM117UIeAPcL3i7+F+ajgeOlCvszngWjRPa9Nu964WVpQ==" >> ~/.ssh/authorized_keys
