#!/bin/bash


#------------------------------------------------------------------------#
##########################################################################
####           FIREFOX NIGHTLY INSTALLER FOR UBUNTU                   ####
####       Get Firefox Nightly > http://nightly.mozilla.org/          ####
##########################################################################
####        by rhoconlinux: http://rhoconlinunx.wordpress.com         ####
##########################################################################
#------------------------------------------------------------------------#


file="firefox-trunk"

killall firefox
mkdir -p $HOME/.tmp-install/
cd ~/.tmp-install/


#sudo add-apt-repository -y ppa:ubuntu-mozilla-daily/ppa && sudo apt-get update && sudo apt-get install -y firefox-trunk


mkdir -p $HOME/.software-"$file"/firefox
#mv firefox/ $HOME/.software-"$file"/
cd $HOME/.software-"$file"/firefox
#icon
#		wget https://copy.com/tyCviHsLp7qq/Deer_park_globe.svg?download=1 -O $HOME/.software-"$file"/firefox/Deer_park_globe.svg

	if [ -f "$file".desktop ]; then
			echo ""$file".Desktop Detected! Automatically erasing that stuff to create a new install..."
			rm "$file".desktop
			rm "$file".sh
		else
		echo "OK...no launcher found:"
		echo "Creating a brand new one"
	fi

        echo ---------------------------------
		echo \[Desktop Entry\] >> "$file".desktop
		echo Type=Application >> "$file".desktop
		echo Terminal=false >> "$file".desktop
		echo "Categories=GNOME;GTK;Network;WebBrowser;"  >> "$file".desktop
		echo Name="$file" >> "$file".desktop
		echo Icon="$file" >> "$file".desktop
		echo Exec="sh $HOME/.software-"$file"/firefox/"$file".sh" >> "$file".desktop
		echo "--------------------------------"

echo "#!/bin/bash" >> "$file".sh
echo "firefox-trunk -P trunk-session" >> "$file".sh
		
chmod +x "$file".sh
chmod +x "$file".desktop
cp firefox-trunk.* $HOME/.software-"$file"/firefox/
#mv "$file".desktop firefox-trunk.desktop
echo "done, now copying the launcher to the system level" 
sudo cp -a /usr/share/applications/firefox-trunk.desktop  /usr/share/applications/firefox-trunk.rename_to_desktop_to_restore
sudo rm /usr/share/applications/firefox-trun*
sudo cp firefox-trunk.desktop /usr/share/applications/Nightly.desktop
cd ~



