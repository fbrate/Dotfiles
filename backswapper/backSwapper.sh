#!/bin/bash

DIR="$HOME/Pictures/Backgrounds/"
Pic=""
lastPic=""
lastLastPic=""
Pic3=""
rm $HOME/scripts/backswapper.log

while true
do

    while true
    do
        Pic="$DIR$(ls $DIR | shuf -n1)"
        echo 'pick here ' $Pic >> $HOME/scripts/backSwapper.log
         if [ "$Pic" = "$lastPic" ] || [ "$Pic" = "$lastLastPic" ] || [ "$Pic" = "$Pic3" ]
        then
            echo 'procced ' $Pic >> $HOME/scripts/backSwapper.log
            Pic="$(ls $DIR | shuf -n1)"
        else
            break
        fi
    done

    feh --bg-fill $Pic
    Pic3=$lastLastPic
    lastLastPic=$lastPic
    lastPic=$Pic
    echo $$ > $HOME/scripts/backSwapper.pid
    sleep 2400
	#echo $! > backswapper.pid2

done
# feh --bg-fill $(ls $DIR | shuf -n1)
