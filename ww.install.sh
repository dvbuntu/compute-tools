#! /bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# move to Downloads
echo "Making a Downloads directory"
install -d $HOME/Downloads
cd $HOME/Downloads

pkgs=('tmux'
         'ipython'
         'python3'
         'python-numpy'
         'vim'
         'slimux-git'
         )

# handle the base packages
echo "Installing core packages"
sudo pacman -Sy
for i in "${pkgs[@]}"
do
    sudo pacman -S $i
done


# now install slimux
echo "Installing slimux-git"
curl -O https://aur4.archlinux.org/cgit/aur.git/snapshot/slimux-git.tar.gz
tar -xzvf slimux-git.tar.gz
cd slimux-git
makepkg -si
sudo pacman -U slimux-git*.tar.xz
cd ..


