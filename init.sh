#! /bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# move to Downloads
install -d $HOME/Downloads
cd $HOME/Downloads

# First install package-query
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
         'zsh'
         )
aur_pkgs=(
         'oh-my-zsh-git'
         'slimux-git'
         )

sudo pacman -Sy
for i in "${pkgs[@]}"
do
    sudo pacman -S $i
done

for i in "${aur_pkgs[@]}"
do
    yaourt $i
done

# get some sane defaults going
git clone git://github.com/dvbuntu/.files.git

# run the installation command
cd .files
./install.sh

# switch shell to zsh
chsh -s $(which zsh)

