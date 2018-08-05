#!/bin/bash
dir=$(pwd)
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in `find . -type f ! -name "install.sh" ! -path "*/.*/*" -exec basename {} \;`; do
  echo $file
  mv ~/."$file" ~/."$file"_`date +%s`_bak
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/.$file
done

