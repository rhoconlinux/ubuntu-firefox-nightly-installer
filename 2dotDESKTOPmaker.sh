#!/bin/bash

file="firefox-280a1"
ver="firefox-28.0a1.es-AR.linux-x86_64.tar.bz2"
#path="$HOME/.software-firefox-280a1/"


killall firefox
mkdir -p $HOME/.tmp-install/
cd .tmp-install/


	if [ -f "$ver" ]; then
			echo ""$ver" Detected! not downloading..."
			tar -jxf "$ver"
		else
		echo "downloading firefox nightly:"
		wget http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-mozilla-central-l10n/firefox-28.0a1.es-AR.linux-x86_64.tar.bz2
		tar -jxf "$ver"
		#rm "$ver"
	fi




firefox -CreateProfile nightly-session

mkdir -p $HOME/.software-"$file"/
mv firefox/ $HOME/.software-"$file"/
cd $HOME/.software-"$file"/firefox
#icon
		wget http://upload.wikimedia.org/wikipedia/commons/9/9f/Deer_park_globe.svg -O $HOME/.software-firefox-280a1/firefox/Deer_park_globe.svg

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
		echo Icon=$HOME/.software-firefox-280a1/firefox/Deer_park_globe.svg >> "$file".desktop
		echo Exec=sh $HOME/.software-firefox-280a1/firefox/"$file".sh >> "$file".desktop
		echo "--------------------------------"

echo "#!/bin/bash" >> "$file".sh
echo "$HOME/.software-firefox-280a1/firefox/firefox -P nightly-session" >> "$file".sh
		
chmod +x "$file".sh
chmod +x "$file".desktop

echo "done, now copying the launcher to the system level" 
sudo cp "$file".desktop /usr/share/applications
#cd ~



