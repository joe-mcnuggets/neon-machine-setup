#!/bin/bash

PURPLE='\033[1;35m'
NC='\033[0m'

echo -e "${PURPLE}"
cat << 'HERE'
    _____
    \/\  |  .
   ()))))))/
  ((/ \)))))
  ((),>((((    Let's setup your machine!
   )\__ ))
  ( __\((__
   /  )\/\,\
  /.|/ _)_) \
 ( \ \  o| \|_
  \|  )_o| (__\
 _/| /.__|  _/ \__
_(_//  /|\\ \ ||\.\
   /   \|/ \ \_____\
   '-..___.'
     \  |/
      \ |
     .')|
    ( / |
    /.\ |
  (_ \ )|
   ) -/ )
 mrf-'_/|
HERE
echo -e "$NC"

# Common
echo -e "${PURPLE}Installing git${NC}"
sudo apt-get install -y git

# Emacs
echo -e "${PURPLE}Installing libs to build emacs${NC}"
sudo apt-get install -y build-essential xorg-dev libjpeg-dev libgif-dev libtiff-dev gnutls-dev libtinfo-dev libcairo-dev
# TODO: wget emacs, check signature and build
# ./configure --with-cairo
# TODO: become less lazy

echo -e "${PURPLE}Cloning emacs config${NC}"
mkdir ~/emacs-themes
cd ~/emacs-themes
git clone https://github.com/joe-mcnuggets/caroline-theme.git

cd ~
git clone https://github.com/joe-mcnuggets/emacs-config.git
mv ~/emacs-config/.emacs ~
rm -rf  ~/emacs-config

cd ~/.emacs.d
git clone https://github.com/jwiegley/use-package.git

# Zsh
echo -e "${PURPLE}Installing zsh${NC}"
sudo apt-get install zsh
echo -e "${PURPLE}Run chsh -s $(which zsh) to set zsh as default${NC}" 
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# RVM
echo -e "${PURPLE}Installing RVM${NC}"
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable
source /home/parrot/.rvm/scripts/rvm
echo -e "${PURPLE}Installing Ruby 2.6.3${NC}"
rvm install 2.6.3
rvm --default use 2.6.3
ruby -v

# NodeJS
echo -e "${PURPLE}Installing NodeJS${NC}"
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs
node -v

echo -e "${PURPLE}Installing Yarn${NC}"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn

echo -e "${PURPLE}Installing Go${NC}"
cd ~
# TODO: use variables
wget https://dl.google.com/go/go1.12.5.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.12.5.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
go -v
# TODO: automate this
echo "Add export PATH=$PATH:/usr/local/go/bin to your ./.profile"
