#!/bin/bash

script_directory=$(dirname $(realpath $0))
function update_if_new {
	if [ ! -f ~/$1 ]; then
		cp $script_directory/configs/$1 ~/$1
		return
	fi

	hash_of_repo_file=$(sha1sum "$script_directory/configs/$1" | awk '{split($0,elements," "); print elements[1]}')
	hash_of_existing_file=$(sha1sum ~/$1 | awk '{split($0,elements," "); print elements[1]}')

	if [ $hash_of_repo_file != $hash_of_existing_file ]; then
		cp $script_directory/configs/$1 ~/$1
	fi
}

root_rc_files=(".vimrc" ".zshrc" ".tmux.conf")

for file in ${root_rc_files[@]}; do
	update_if_new $file
done

rm -rf ~/bashrc_extensions
cp -r $script_directory/configs/bashrc_extensions ~/bashrc_extensions
