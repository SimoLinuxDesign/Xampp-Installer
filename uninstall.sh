#!/bin/bash
echo "Controllo esistenza dei file..."
xamppsh=/usr/share/xampp/xampp.sh
xamppdesk=/usr/share/applications/xampp.desktop
htdocsdesk=/usr/share/applications/htdocs.desktop
xamppimg=/usr/share/xampp/xampp.png
htdocsimg=/usr/share/xampp/htdocs.png
leggimi=/usr/share/xampp/readme.txt
xamppfold=/usr/share/xampp
xampplampp=/opt/lampp
if [ -f "$xamppsh" ] ; then
  sudo rm $xamppsh
  echo "'.xampp.sh' eliminato con successo!"
else
 echo "'.xampp.sh' non presente."
fi

if [ -f "$xamppdesk" ] ; then
  sudo rm $xamppdesk
  echo "'xampp.desktop' eliminato con successo!"
else
 echo "'xampp.desktop' non presente."
fi

if [ -f "$htdocsdesk" ] ; then
  sudo rm $htdocsdesk
  echo "'htdocs.desktop' eliminato con successo!"
else
 echo "'htdocs.desktop' non presente."
fi

if [ -f "$xamppimg" ] ; then
  sudo rm $xamppimg
  echo "'xampp.png' eliminato con successo!"
else
 echo "'xampp.png' non presente."
fi

if [ -f "$htdocsimg" ] ; then
  sudo rm $htdocsimg
  echo "'htdocs.png' eliminato con successo!"
else
 echo "'htdocs.png' non presente."
fi
if [ -f "$leggimi" ] ; then
  sudo rm $leggimi
  echo "'LEGGIMI-IMPORTANTE.txt' eliminato con successo!"
else
 echo "'LEGGIMI-IMPORTANTE.txt' non presente."
fi
if [ -d "$xamppfold" ] ; then
  sudo rm -r $xamppfold
  echo "Cartella 'xampp' in '$xamppfold' eliminata con successo!"
else
 echo "Cartella 'xampp' in '$xamppfold' non presente."
fi
if [ -d "$xampplampp" ] ; then
  sudo rm -r $xampplampp
  echo "Cartella 'lampp' in '$xampplampp' eliminata con successo!"
else
 echo "Cartella 'lampp' in '$xampplampp' non presente."
fi






#sudo rm -i ~/Scrivania/.xampp.sh
#sudo rm -i /usr/share/applications/xampp.desktop
#sudo rm -i /usr/share/applications/htdocs.desktop
#sudo rm -rf ~/Immagini/xampp/
