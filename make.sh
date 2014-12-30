#!/usr/bin/env bash
####################
# Creates symlinks #
####################

#### Variables

dir=$(pwd)
echo "Dir: $dir"
olddir=~/dotfiles_old
files="bashrc vimrc scripts bin vim screenrc"
timestamp=$(date +%Y-%m-%d-%H-%M)

####

# Create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to dotfiles directory
echo "Changing to the $dir directory"
cd "$dir"
echo "...done"

# move any existing dotfiles in homedir
for file in $files
do
  echo "Moving ~/.$file"
  mv -v ~/."$file" "$olddir/$file-$timestamp"
  echo "Creating symlink to $file"
  ln -sf "$dir/$file" ~/."$file"
done
