#!/bin/bash

script_directory=$(dirname $(realpath $0))

git config --global user.name "Mason Blalock"
git config --global user.email "15042748+blalockma@users.noreply.github.com"

cp -r $script_directory/configs/bashrc_extensions ~/bashrc_extensions

# Mono
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list

# dotnet
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

# Azure Functions Core Tools
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-$(lsb_release -cs)-prod $(lsb_release -cs) main" > /etc/apt/sources.list.d/dotnetdev.list'

sudo add-apt-repository ppa:neovim-ppa/stable

# Package installs
sudo apt update
sudo apt install -y gnupg ca-certificates zsh unzip mono-devel dotnet-sdk-3.1 dotnet-sdk-6.0 azure-functions-core-tools-3 fzf silversearcher-ag tmuxinator software-properties-common neovim ripgrep gcc make g++

wget -qO- https://aka.ms/install-artifacts-credprovider.sh | bash
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
az extension add --name azure-devops

dotnet tool install -g fsautocomplete

# Install fonts
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDCc7TXg6mf5o4Xm0gyGESTZfCndENu8RyVdJJ8vCKnwuNQspCRm+Q+7dYF+KPhOPzXg7cSYjdf4ETKOCug6SfxTPKjy6bhm4XvZJWImD6Dtnw2b/HAqnY4huvFunigkKwVClpHE6GSobmlpytT+g/AUQ5K9WSQOQ180L4ipIyoAffxaWuWkMR8nWLkhvjbyuQwyxBgxR/vuY3ZPArUJl5SGAzoI2lwVfebqbFrYhUvyN9pU3kng1JsuaGo9OKN8x0sYn4g+HCQM7W6ilk7M4Md8e1jzDkFqQiN/Lbe+gA9PYAp+pNr79SaZWap7BE19L1hXMajwB0enRaga1iC7Eo2wb4YkaKTzWWGLPSY8/fin5XaV90wH93LVDv+OLLUrLRgvwbcHFzF6rxUwlFL1WeYmBPLQmY7trcT5tC1CHp0HKP7+gXTuh32hWV+mgVYlZca+sajzUhe6am7FmcsBQ83facxM+9D084AzeUsUzbhCjmpnmBxdznJRepTyNRuLz10NH3xjVyvKlHU/qUKzEO+c7rHnHWuJAgE6uy89T4t+LzX2A3qab1rYJ//81DPQrLOPrS2rHEaQPKcw8h5/UUkXzLXZDe7NooyaxgSllv0q4WBT+aHHC+5gv2m0CWRcMM117UIeAPcL3i7+F+ajgeOlCvszngWjRPa9Nu964WVpQ==" >> ~/.ssh/authorized_keys

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install --lts
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

npm install -g azurite

mkdir -p ~/.config/nvim/
echo 'set runtimepath^=~/.vim runtimepath+=~/.vim/after' >> ~/.config/nvim/init.vim
echo 'let &packpath = &runtimepath' >> ~/.config/nvim/init.vim
echo 'source ~/.vimrc' >> ~/.config/nvim/init.vim

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Copy configs over
shopt -s dotglob
for file in $script_directory/configs/*; do
	if [ ! -d "$file" ]; then
		cp $file ~
	fi
done
cp -r $script_directory/configs/.config ~

# Cleanup
rm -f ~/.zshrc.pre-oh-my-zsh
rm -f ~/.shell.pre-oh-my-zsh
sudo rm ~/.zcompdump*
