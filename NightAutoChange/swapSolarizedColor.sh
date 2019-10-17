#!/bin/bash


# Create or load layout:
load_or_create=$(echo -e "Dark\nLight" | dmenu -l 2 -p "Select mode: ")

#Default path

#echo $load_or_create
if [ "Dark" == "$load_or_create" ]; then
	
	#xfce
	head -n -7 $HOME/.config/xfce4/terminal/terminalrc > $HOME/.config/xfce4/terminal/terminalrc.temp	
	cat $HOME/Scripts/NightAutoChange/src/xfce4-term-color-pallete-dark >>  $HOME/.config/xfce4/terminal/terminalrc.temp
        mv $HOME/.config/xfce4/terminal/terminalrc.temp $HOME/.config/xfce4/terminal/terminalrc


	sed -i '/set background=/c\set background=dark' ~/.vimrc
	sed -i '/let g:airline_solarized_bg=/c\let g:airline_solarized_bg="dark"' ~/.vimrc
	sed -i '/gtk=theme-name=/c\gtk-theme-name=NumixSolarizedDarkBlue' "$HOME/.gtkrc-2.0.mine"

	#rofi
	sed -i '0,/base16-solarized-light.rasi/s/base16-solarized-light.rasi/base16-solarized-dark.rasi/' $HOME/.config/i3/config


	#i3

	sed -i '/set $solBGcolor/c\set $solBGcolor 	#002b36' $HOME/.config/i3/config	
	sed -i '/set $solBGalt/c\set $solBGalt 	#073642' $HOME/.config/i3/config
	#poly


	sed -i '/foregroundLighter= /c\foregroundLighter= #586e75' "$HOME/.config/polybar/config"	
	sed -i '/foregroundMain	= /c\foregroundMain= #657b83' "$HOME/.config/polybar/config"
	sed -i '/backgroundLighter= /c\backgroundLighter= #002b36' "$HOME/.config/polybar/config"
	sed -i '/backgroundMain= /c\backgroundMain= #073642' "$HOME/.config/polybar/config"

	i3-msg restart
elif [ "Light" == "$load_or_create" ]; then

	
	head -n -7 $HOME/.config/xfce4/terminal/terminalrc > $HOME/.config/xfce4/terminal/terminalrc.temp	
	cat $HOME/Scripts/NightAutoChange/src/xfce4-term-color-pallete-light >>  $HOME/.config/xfce4/terminal/terminalrc.temp
        mv $HOME/.config/xfce4/terminal/terminalrc.temp $HOME/.config/xfce4/terminal/terminalrc

	sed -i '/set background=/c\set background=light' ~/.vimrc
	sed -i '/let g:airline_solarized_bg=/c\let g:airline_solarized_bg="light"' ~/.vimrc
	sed -i '/gtk=theme-name=/c\gtk-theme-name=NumixSolarizedLightBlue' "$HOME/.gtkrc-2.0.mine"
 	sed -i '/gtk=theme-name=/c\gtk-theme-name=NumixSolarizedLightBlue' "$HOME/.config/gtk-3.0/settings.ini"

	#rofi

	sed -i '0,/base16-solarized-dark.rasi/s/base16-solarized-dark.rasi/base16-solarized-light.rasi/' $HOME/.config/i3/config

	#i3

	sed -i '/set $solBGcolor/c\set $solBGcolor 	#fdf6e3' $HOME/.config/i3/config	
	sed -i '/set $solBGalt/c\set $solBGalt 	#eee8d5' $HOME/.config/i3/config
		




	#poly
	sed -i '/foregroundLighter= /c\foregroundLighter= #93a1a1' "$HOME/.config/polybar/config"
	sed -i '/foregroundMain	= /c\foregroundMain= #839496' "$HOME/.config/polybar/config"
	sed -i '/backgroundLighter= /c\backgroundLighter= #fdf6e3' "$HOME/.config/polybar/config"
	sed -i '/backgroundMain= /c\backgroundMain= #eee8d5' "$HOME/.config/polybar/config"
	i3-msg restart


fi
