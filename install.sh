#!/bin/bash
#################################################################################
#                          Sezione Variabile colori                             #
#################################################################################
und=$(tput smul)     	 # attiva il sottolineato
nound=$(tput rmul)  	 # disattiva il sottolineato
bold=$(tput bold)   	 # attiva il grassetto
rev=$(tput rev)          # attiva la modalità inversa 
                         # (scambia sfondo e carattere)
normal=$(tput sgr0)      # annulla tutti gli effetti e torna al default
tred=$(tput setaf 1)     # carattere rosso
tgreen=$(tput setaf 2)   # carattere verde
tyellow=$(tput setaf 3)  # carattere giallo
tblue=$(tput setaf 4)    # carattere blu
tpurple=$(tput setaf 5)  # carattere porpora
tcyan=$(tput setaf 6)    # carattere ciano (azzurro)
twhite=$(tput setaf 7)   # carattere bianco
bred=$(tput setab 1)   	 # sfondo carattere rosso
bgreen=$(tput setab 2)   # sfondo carattere verde
byellow=$(tput setab 3)  # sfondo carattere giallo
bblue=$(tput setab 4)    # sfondo carattere blu
bpurple=$(tput setab 5)  # sfondo carattere porpora
bcyan=$(tput setab 6)    # sfondo carattere ciano (azzurro)
bwhite=$(tput setab 7)   # sfondo carattere bianco
################################################################################

######### MAIN VARIABLES AND ARRAY #########
userbin="/usr/bin/"
installdir=$(pwd)
relversion=$(lsb_release -d)
desktopenv=$(echo $XDG_CURRENT_DESKTOP)
terminalfound=0
downloadfile=0
fmfound=0
checkinstall=0
checkdownload=0
number=1

declare -a oslist # List of OS #
oslist=(opensuse debian ubuntu lubuntu xubuntu ubuntu-budgie kubuntu ubuntu-mate fedora mageia archlinux elementaryos)

declare -a termlist # List of Terminals #
termlist=(gnome-terminal konsole xfce4-terminal mate-terminal lxterminal qterminal io.elementary.terminal deepin-terminal alacritty termite tilix terminator)

declare -a filemnglist # List of File Managers #
filemnglist=(nautilus nemo caja thunar pcmanfm dophin io.elementary.files pcmanfm-qt spacefm mc)
############################################

############## CHECK OS-SYSTEM ############
for ((i=0; i<${#oslist[@]}; i++)); do
    lowercase_relversion=$(echo "$relversion" | tr '[:upper:]' '[:lower:]')
    lowercase_oslist=${oslist[$i],,}  # Converti l'elemento corrente di oslist in minuscolo
    if [[ "$lowercase_relversion" == *"$lowercase_oslist"* ]]; then
        osname=${oslist[$i]}
        break
    fi
done
############################################

######## INITIALIZZATION INSTALL ###########
clear
echo $bred"
#######################################################################
                      Welcome to the Xampp Installer                   
#######################################################################$normal
$tblue
 This script will install xampp on your system without any difficulty.
 
$tred - It will be checked if some version of xampp already exists.
 - You will be asked for super user permission.
 - Files will be downloaded from the internet.
 - Shortcuts and files will be created on your system.$normal

 Do you wish to continue? (y or n)
 
#######################################################################"

############################################

############# CHECK CONTINUE ###############
read check;
if [ $check = "n" ]; then
	exit
elif [ $check = "y" ]; then
	clear
else
	echo "Wrong Button, closing installation..."
	exit
fi
############################################

############ CHECK IF XAMPP IS INSTALLED ############
if [ -e "/opt/lampp/manager-linux-x64.run" ]; then
	checkinstall=1
else
	checkinstall=0
fi
############################################

######## CHECK NAME DOWNLOAD FOLDER ########
home="/home/"
me=$(whoami)
xampp="xampp.run"
if [ -d "$homeDownload" ]; then
    dirdown="/Downloads/"
else
    dirdown="/Scaricati/"
fi
downfolder=$home$me$dirdown
xamppdown=$home$me$dirdown$xampp
############################################

####### CHECK XAMPP.RUN IN DOWNLOAD ########
echo "CHECK XAPP RUN"
if [ -e "$xamppdown" ]; then
    checkdownload=1
else
    checkdownload=0
fi
############################################

############# CHECK TERMINAL ###############
echo "CHECK TERMINAL"
for ((i=0; i<${#termlist[@]}; i++)); do
    if [ -e "$userbin${termlist[$i]}" ]; then
        terminal=${termlist[$i]}
        terminalfound=1
        break
    fi
done
############################################

########### CHECK FILE MANAGER #############
echo "CHECK FILE MANAGER"
for ((i=0; i<${#filemnglist[@]}; i++)); do
    if [ -e "$userbin${filemnglist[$i]}" ]; then
        filemng=${filemnglist[$i]}
        fmfound=1
        break
    fi
done
############################################

############ CHECK REINSTALL ##############

if [ $checkinstall == 0 ]; then
	clear
#	echo "CHECK REINSTALL"
	echo $tblue"Xampp is not installed yet on this system."$normal
	echo "Press $bold$green'Enter'$normal to continue..."
	read continue
else 
	clear
	echo $tblue"There is already an installation of xampp." $normal
	echo "Do you to to reinstall xampp again: $tgreen y$normal or$tred n$normal?"
	read check
	if [ $check = "y" ]; then
		reinstall=1
	else
		reinstall=0
		exit
	fi
fi
############################################

########### CHECK DOWNLOADED FILE ##########
if [ $checkdownload == 1 ]; then
	clear
	echo $tblue"There is already an installer of xampp in the download folder."$normal
	echo "Do You wish to use that?  ($tgreen y$normal or $tred no$normal)"
	read check
	if [ $check = "n" ]; then
		downloadfile=1
	else
		downloadfile=0
	fi
else
	downloadfile=1
fi
############################################

############# DOWNLOADING FILE #############
if [ $downloadfile == 1 ]; then
	clear
	echo "$bold$tcyan$bblue'https://sourceforge.net/projects/xampp/files/XAMPP%20Linux/'$normal"
	echo ""
	echo $tblue"1$normal - To download the latest version of xampp, right-click on this link and copy it."
	echo ""
	echo $tblue"2$normal - Go into your browser and paste it. Once we choose and click with the left mouse button on the version number (e.g. 8.2.12)."
	echo ""
	echo $tblue"3$normal - Now we right-click on the single file (e.g. xampp-linux-x64-8.2.12-0-installer.run) and select 'copy link' and paste it here again with the right mouse button and pressing 'paste'."
	echo $bred$tyellow$bold"Paste here the link:"$normal $tgreen
	echo ""
	read lastversion 
	clear
	echo "Starting download..."
	cd $downfolder
	wget -O "xampp.run" "$lastversion"
	clear
	echo "Download completed"
	echo $normal"Press $bold'Enter'$normal to continue..."
	read continue
fi
downloadfile=0
############################################

############# INSTALLING FILE #############
if [ $downloadfile == 0 ]; then
	echo $tred"You will be asked several times to enter your sudo password:"$normal
	echo "Sudo Passowrd: "
	sudo cd $downfolder
	sudo chmod 777 xampp.run
	clear
	sudo ./xampp.run
	echo $tblue$bold"Installation compleated!"$normal
	echo "Press $tgreen$bold'Enter'$normal to continue..."
	read continue
fi
###########################################

############## CREATING FOLDERS ###########
sudo mkdir -p /usr/share/xampp
echo $tgreen"Created Folder in '/usr/share/xampp/"
cd $installdir
sudo cp -i xampp.png /usr/share/xampp/xampp.png
echo $tyellow"Created xampp icon"
sudo cp -i htdocs.png /usr/share/xampp/htdocs.png
echo $tpurle"Created htdocs icon"
sudo cp -i .readme.txt /usr/share/xampp/readme.txt
echo $tcyan"Created readme file"
echo ""
############################################

########## CREATING NEEDED FILES ###########
sudo cp -i xampp.sh /usr/share/xampp/xampp.sh
sudo chmod 777 /usr/share/xampp/xampp.sh
echo $tblue"Created file sh"
cp xampp tmp
sudo sed -i "s/NOMETERMINALE/$terminal/g" tmp
sudo mv -i tmp /usr/share/applications/xampp.desktop
cp htdocs tmp2
sudo sed -i "s/FILEMANAGER/$filemng/g" tmp2
sudo mv -i tmp2 /usr/share/applications/htdocs.desktop
echo $tred"Created Lauchers"$normal
##############################################

########### PERMISSION FOR HTDOCS ############
sudo chmod 777 /opt/lampp/htdocs
sudo chmod 777 /opt/lampp/htdocs/*
echo "Correctly updated user permissions for htdocs folder"
echo $normal"Press 'Enter' to continue"
read continue
###############################################

######### COMPLEATING INSTALLATIONS ##########
rm tmp
rm tmp2
rm xampp.run
clear
echo $tpurple$bold"################################################"
echo $twhite$bpurple"              Installation completed            "$normal                              
echo $tpurple$bold"################################################"$normal
echo "               Press $bold$tgreen'Enter'$normal to exit!"
echo $tpurple$bold"################################################"$normal
read continue
exit
