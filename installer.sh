#!/bin/bash

host="$HOME/computer-0.1"
dotfiles="$host/dotfiles"
pkg="$host/packages"
faillog="$HOME/.custom/faillog.txt"
source "$host/script.sh"

run-installer-one() {
        sudo -v
        install-packages pac $pkg/audio-drivers
        install-packages pac $pkg/amd-drivers
        install-packages pac $pkg/pacman
        install-yay
        install-packages aur $pkg/aur
        install-packages pac $pkg/fonts
        install-packages aur $pkg/fonts-aur
        #install-laptop-specifics
        use-zsh
        install-git-packages
        install-discord-screenaudio
        enable-services
        home-permissions
        migrate-dotfiles #add noconfirm todo
        sudo -k
}
run-installer-two() {
        sudo -v
        install-bottles
        #install-ableton #not yet working
        install-packages pac emulators
        install-packages aur emulators-aur
        install-packages pac virtualization
        sudo -k
}







run-installer() {

echo "welcome to the installer script hello"
sleep 7
echo "please select installer option..."
sleep 2
echo "these are your options:"
sleep 4
echo "    1 : install "
sleep 1
echo "please type your answer (i.e 1)"
        
        read answer
        if [[ "$answer" =~ ^[1]$ ]]; then
                echo "affirmative."
                sleep 7
                echo "preparing..."
                sleep 4
                echo "installing install array"
                sleep 0.2
                echo "executing"
                sleep 0.2
                echo "generating install"
                sleep 0.2
                echo "installing..."
                sleep 0.4
                run-installer-one
                sleep 3
                echo "congratulations! you have successfully run the installer!"
                sleep 2
                echo "you have now unloacked a new install option! yay!"
                sleep 3
                echo "you have unlocked install option number 2!"
                sleep 4
                echo "type '2' as an install option to get some crazy stuff! thank u!"
        fi
        if [[ "$answer" =~ ^[2]$ ]]; then
                echo "welcome to the installer part 2!"
                sleep 3
                echo "allow me to prepare your installation..."
                sleep 7
                echo "scanning..."
                sleep 3
                echo "ok, i have determined that your system is prepared to install part 2 of this installation media"
                echo "please wait for the the install which will start now."
                sleep 10
                run-installer-two
                sleep 3
                echo "you installer part two has finished it's process, thank you for installing!"
        fi
        if [[ "$answer" =~ ^[exit]$ ]]; then
                sleep 4
                echo "INSTALLER SESSION TERMINATED"
        else
                read answer
        fi

}

