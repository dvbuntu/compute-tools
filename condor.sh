#! /bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# move to Downloads
echo "Making a Downloads directory"
install -d $HOME/Downloads
cd $HOME/Downloads

# install required packages
pkgs=(
         'condor'
         )

echo "Installing condor packages -- choose manual"
sleep 1
sudo apt-get update
for i in "${pkgs[@]}"
do
    sudo apt-get install $i
done

echo "Configuring condor"
cd $DIR
sudo cp /etc/condor/condor_config /etc/condor/condor_config.bkup
sudo cp condor_config /etc/condor/condor_config
sudo cp 40root.config /etc/condor/config.d/

