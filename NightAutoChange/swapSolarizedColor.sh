#!/bin/bash



# Create or load layout:
load_or_create=$(echo -e "Dark\nLight" | dmenu -l 2 -p "Select mode: ")

#Default path

#echo $load_or_create
if [ "Dark" == "$load_or_create" ]; then
	
	cp ./src/xfce4-term-color-pallete-dark ~/.config/xfce4/terminal/terminalrc
	sed -i '/set background=/c\set background=dark' ~/.vimrc
	sed -i '/let g:airline_solarized_bg=/c\let g:airline_solarized_bg="dark"' ~/.vimrc
#	sed -i '/gtk=theme-name=/c\gtk-theme-name=NumixSolarizedDarkBlue' "$HOME/.gtkrc-2.0.mine"

elif [ "Light" == "$load_or_create" ]; then

	cp ./src/xfce4-term-color-pallete-light ~/.config/xfce4/terminal/terminalrc
	sed -i '/set background=/c\set background=light' ~/.vimrc
	sed -i '/let g:airline_solarized_bg=/c\let g:airline_solarized_bg="light"' ~/.vimrc
#	sed -i '/gtk=theme-name=/c\gtk-theme-name=NumixSolarizedLightBlue' "$HOME/.gtkrc-2.0.mine"

fi
