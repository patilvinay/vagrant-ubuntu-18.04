#!/bin/bash -e
# $1 = oommf source
# $2 = tcl/tk version e.g. 8.6
  
 echo "Updating ubuntu"
 # Update apt
 sudo apt-get update -y


 echo "installing zsh"
 sudo apt install zsh -y

 echo "installing tmux"
 sudo apt install tmux -y





#eval $(ssh-agent -s)
#cat /keys/.ssh/vinay-wsl-git >> /home/vagrant/.ssh/authorized_keys

#ssh-add /keys/.ssh/vinay-wsl-git

INSTALLDIR=my-settings
INSTALLPATH=/home/$USER
  # Control will enter here if $DIRECTORY exists.vi
  #ymkdir -p $INSTALLPATH/$INSTALLDIR/oh-my-zsh #create one more home
  



#mkdir $INSTALLPATH/$INSTALLDIR



sudo apt-get -y install git apt-transport-https ca-certificates curl software-properties-common


sudo chsh -s /bin/zsh vagrant
rm -rf $INSTALLPATH/$INSTALLDIR
mkdir -p $INSTALLPATH/$INSTALLDIR
git clone https://github.com/patilvinay/my-settings.git $INSTALLPATH/$INSTALLDIR

mkdir -p $INSTALLPATH/$INSTALLDIR/oh-my-zsh
git clone https://github.com/ohmyzsh/ohmyzsh.git $INSTALLPATH/$INSTALLDIR/oh-my-zsh

mkdir -p $INSTALLPATH/$INSTALLDIR/powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $INSTALLPATH/$INSTALLDIR/powerlevel10k

mkdir -p $INSTALLPATH/$INSTALLDIR/tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm $INSTALLPATH/$INSTALLDIR/tmux/plugins/tpm
sudo chown -R vagrant:vagrant $INSTALLPATH