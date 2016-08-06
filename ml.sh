#! /bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# move to Downloads
echo "Making a Downloads directory"
install -d $HOME/Downloads
cd $HOME/Downloads

# grab cuda stuff
pkgs=(
    'nvidia-361-updates' 
    'nvidia-361-updates-dev'
    'nvidia-prime'      
    'nvidia-profiler'
    'nvidia-settings'
    'nvidia-visual-profiler'
    'libcuda1-361-updates'
    'libcudart7.5:amd64'
    'nvidia-cuda-dev'
    'nvidia-cuda-doc'
    'nvidia-cuda-gdb'
    'nvidia-cuda-toolkit'
	'nvidia-opencl-dev:amd64'
	'nvidia-opencl-icd-361-updates'
)

echo "Installing cuda packages"
sudo apt-get update
for i in "${pkgs[@]}"
do
    sudo apt-get install $i
done

# More CUDA setup
sudo apt-get install g++-4.8
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 20
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 10
sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 30
sudo update-alternatives --set cc /usr/bin/gcc
sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 30
sudo update-alternatives --set c++ /usr/bin/g++


# install required packages
pypkgs=(
         'theano'
         'keras'
         )

echo "Installing core packages"
sudo apt-get update
for i in "${pypkgs[@]}"
do
    sudo pip3 install $i
    #sudo apt-get install $i
done

# need to edit theano, hack in an extra line
# add cmd.append('-D_FORCE_INLINES') on line 360 to
# /home/vanboxel/.local/lib/python3.5/site-packages/theano/sandbox/cuda/nvcc_compiler.py

