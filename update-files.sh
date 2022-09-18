#!/bin/bash
function update_if_new {
	if [ ! -f ~/$1 ]; then
		cp ./configs/$1 ~/$1
		return
	fi

	hash_of_repo_file=$(sha1sum "./configs/$1" | awk '{split($0,elements," "); print elements[1]}')
	hash_of_existing_file=$(sha1sum ~/$1 | awk '{split($0,elements," "); print elements[1]}')

	if [ $hash_of_repo_file != $hash_of_existing_file ]; then
		cp ./configs/$1 ~/$1
	fi
}

root_rc_files=(".vimrc" ".zshrc")

for file in ${root_rc_files[@]}; do
	update_if_new $file
done

rm -rf ~/bashrc_extensions
cp -r ./configs/bashrc_extensions ~/bashrc_extensions
