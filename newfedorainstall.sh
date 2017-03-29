#!/bin/bash
# ====================================================================================================
# title          : newfedorainstall.sh
# description    : This script will take a new fedora install and make it fight-ready for everyday use
# author         : Cory Hilliard
# date           : 2016.03.29
# version        : 0.8    
# usage          : bash newfedorainstall.sh
# ====================================================================================================

mkdir ~/Newinstall
mv newfedorainstall.sh ~/Newinstall
cd ~/Newinstall

echo " "
echo "*****************************************************************"
echo "* Updating System                                               *"
echo "*****************************************************************"
echo " "

dnf -y update

echo " "
echo "*****************************************************************"
echo "* Installing RPMFusion Repositories                             *"
echo "*****************************************************************"
echo " "
dnf -y install --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm 
dnf -y install --nogpgcheck http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo " "
echo "*****************************************************************"
echo "* Installing Google Repository                                  *"
echo "*****************************************************************"
echo " "

cat << EOF > /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome - \$basearch
baseurl=http://dl.google.com/linux/chrome/rpm/stable/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOF

echo " "
echo "*****************************************************************"
echo "* Installing Cinnamon Desktop Environment                       *"
echo "*****************************************************************"
echo " "

#cinnamon
dnf -y groupinstall cinnamon-desktop

echo " "
echo "*****************************************************************"
echo "* Installing Codecs and Drivers                                 *"
echo "*****************************************************************"
echo " "

#codecs/drivers
dnf -y install gstreamer-plugins-good gstreamer-plugins-bad gstreamer-plugins-ugly java java*jdk lame

echo " "
echo "*****************************************************************"
echo "* Installing Games                                              *"
echo "*****************************************************************"
echo " "

#games
dnf -y install hedgewars numptyphysics gweled frozen-bubble numptyphysics five-or-more four-in-a-row gnome-chess gnome-klotski gnome-mahjongg gnome-mines gnome-nibbles gnome-robots gnome-sudoku gnome-tetravex tali iagno swell-foop lightsoff quadrapassel aisleriot minetest fceux antimicro steam

echo " "
echo "*****************************************************************"
echo "* Installing Graphics Applications                              *"
echo "*****************************************************************"
echo " "

#graphic applications
dnf -y install blender inkscape gimp pinta pencil dia shutter mypaint 

echo " "
echo "*****************************************************************"
echo "* Installing Web/Communications Applications                    *"
echo "*****************************************************************"
echo " "

#internet/communications
dnf -y install google-chrome-stable firefox thunderbird filezilla pidgin pidgin-guifications deluge 

echo " "
echo "*****************************************************************"
echo "* Installing Office/Document Editors                            *"
echo "*****************************************************************"
echo " "

#office/readers/editors
dnf -y install libreoffice chmsee evince scite lios

echo " "
echo "*****************************************************************"
echo "* Installing Financial Applications                             *"
echo "*****************************************************************"
echo " "

#finaceapplications
dnf -y install gnucash grisbi homebank 

echo " "
echo "*****************************************************************"
echo "* Installing Media Players                                      *"
echo "*****************************************************************"
echo " "

#mediaplayers/editors
dnf -y install vlc openshot dvdrip hydrogen lmms audacity-freeworld asunder

#DVD Extras
# install negativo17 multimedia repo
dnf config-manager --add-repo=http://negativo17.org/repos/fedora-multimedia.repo
dnf -y install HandBrake-gui HandBrake-cli libdvdcss

echo " "
echo "*****************************************************************"
echo "* Installing Utilities                                          *"
echo "*****************************************************************"
echo " "

#utilities
dnf -y install alacarte cups-pdf unrar liveusb-creator alacarte gparted nspluginwrapper alsa-plugins-pulseaudio libcurl p7zip fedora-icon-theme gconf-editor gnome-tweak-tool nemo-fileroller deja-dup VirtualBox isomaster gnome-software


echo " "
read -p "Would you like to install programmer/developer programs? [y/n] " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then

	echo " "
	echo " "
	echo "*****************************************************************"
	echo "* Installing Programming Tools                                  *"
	echo "*****************************************************************"
	echo " "
	
	#programmingtools
	dnf -y install cmake fpc gcc gcc-c++ eclipse geany codeblocks bluefish git gitg meld devassistant kernel-devel kernel-headers dkms make perl gtk2-devel gtk3-devel valgrind monodevelop gpick
fi

cd ~/
rm -rf ~/Newinstall

echo " "
echo "*****************************************************************"
echo "* COMPLETE!                                                     *"
echo "*                                                               *"
echo "* If you noticed any errors in square brackets like this:       *"
echo "*                                                               *"
echo "* [FAILED]                                                      *"
echo "* [MIRROR]                                                      *"
echo "*                                                               *"
echo "* Just run this whole script again until they're gone.          *"
echo "*                                                               *"
echo "* Please let me know if there are any errors in this script     *"
echo "* or if you have any cool ideas on how to improve it!           *"
echo "*                                                               *"
echo "* Thanks!                                                       *"
echo "*                                                               *"
echo "* -Cory                                                         *"
echo "*****************************************************************"
echo " "
