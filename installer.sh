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
