#!/bin/bash


#------------------------------------------------------------------------#
##########################################################################
####           FIREFOX NIGHTLY INSTALLER FOR UBUNTU                   ####
####       Get Firefox Nightly > http://nightly.mozilla.org/          ####
##########################################################################
####        by rhoconlinux: http://rhoconlinunx.wordpress.com         ####
##########################################################################
#------------------------------------------------------------------------#


file="firefox-290a1"

killall firefox
mkdir -p $HOME/.tmp-install/
cd ~/.tmp-install/


	if [ -f "$ver" ]; then
			echo ""$ver" Detected! not downloading..."
			tar -jxf "$ver"
		else
		echo "downloading firefox nightly:"
		wget http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-trunk/firefox-29.0a1.en-US.linux-x86_64.tar.bz2 -O firefox-nightly.tar.bz2
		tar -jxf firefox-nightly.tar.bz2
		#rm "$ver"
	fi


firefox -CreateProfile nightly-session

mkdir -p $HOME/.software-"$file"/
mv firefox/ $HOME/.software-"$file"/
cd $HOME/.software-"$file"/firefox
#icon
		wget https://copy.com/tyCviHsLp7qq/Deer_park_globe.svg?download=1 -O $HOME/.software-"$file"/firefox/Deer_park_globe.svg

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
		echo Name=nightly-"$file" >> "$file".desktop
		echo Icon=$HOME/.software-"$file"/firefox/Deer_park_globe.svg >> "$file".desktop
		echo Exec=sh $HOME/.software-"$file"/firefox/"$file".sh >> "$file".desktop
		echo "--------------------------------"

echo "#!/bin/bash" >> "$file".sh
echo "$HOME/.software-"$file"/firefox/firefox -P nightly-session" >> "$file".sh
		
chmod +x "$file".sh
chmod +x "$file".desktop

echo "done, now copying the launcher to the system level" 
sudo cp "$file".desktop /usr/share/applications
#cd ~



