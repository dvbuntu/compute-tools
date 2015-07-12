#! /bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# move to Downloads
echo "Making a Downloads directory"
install -d $HOME/Downloads
cd $HOME/Downloads

# First install package-query
echo "Installing basic AUR helper"
curl -O https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz
tar -xzvf package-query.tar.gz
cd package-query
makepkg -si
sudo pacman -U package-query*.tar.xz
cd ..

# now install yaourt
curl -O https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz
tar -xzvf yaourt.tar.gz
cd yaourt
makepkg -si
sudo pacman -U yaourt*.tar.xz
cd ..

# install required packages
pkgs=(
         'xterm'
         'xorg-server'
         'xorg-xinit'
         'xorg-xmodmap'
         'xf86-video-vesa'
         'base-devel'
         'sudo'
         'git'
         'tmux'
         'python3'
         'ipython'
         'python-numpy'
         'vim'
         'openbox'
         'obconf'
         'zsh'
         'firefox'
         )
aur_pkgs=(
         'oh-my-zsh-git'
         'slimux-git'
         'vim-pathogen-git'
         )

echo "Installing core packages"
sudo pacman -Sy
for i in "${pkgs[@]}"
do
    sudo pacman -S $i
done

echo "Installing AUR packages"
for i in "${aur_pkgs[@]}"
do
    yaourt $i
done

# get some sane defaults going
echo "Grabbing sane defaults"
git clone git://github.com/dvbuntu/.files.git

# run the installation command
echo "Installing sane defaults"
cd .files
./install.sh

# switch shell to zsh
echo "switching to zsh"
chsh -s $(which zsh)

