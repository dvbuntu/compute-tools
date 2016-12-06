#! /bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# move to Downloads
echo "Making a Downloads directory"
install -d $HOME/Downloads
cd $HOME/Downloads

# install required packages
pkgs=(
         'xterm'
         'git'
         'tmux'
         'python3'
         'ipython3'
         'python3-numpy'
         'python3-pip'
         'vim'
         'zsh'
         'firefox'
         )

echo "Installing core packages"
sudo apt-get update
for i in "${pkgs[@]}"
do
    sudo apt-get install $i
done

# Get better pip
echo "Upgrading pip"
sudo pip3 install --upgrade pip

# get some sane defaults going
echo "Grabbing sane defaults"
git clone https://github.com/dvbuntu/.files.git

# switch shell to zsh
echo "switching to zsh with oh-my-zsh"
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s $(which zsh)

# run the installation command
echo "Installing sane defaults"
cd .files
git checkout --track origin/ubuntu
git pull
./install.sh


# Get slimux by using pathogen
echo "Installing pathogen and slimux"
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    wget https://tpo.pe/pathogen.vim && \
    mv pathogen.vim ~/.vim/autoload/

cd ~/.vim/bundle && \
    git clone https://github.com/epeli/slimux.git

cp ~/Downloads/.files/.zshrc $HOME/

