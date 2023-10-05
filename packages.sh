install-pacman-packages() {
    pacfile="$HOME/import/packages/pacman"
    if [ -f "$pacfile" ]; then
        sudo pacman -S --needed --noconfirm - < "$pacfile"
    else
      echo "pac package file not found: $pacfile"
    fi
}

install-amd-dri() {
    amdfile="$HOME/import/packages/amd-drivers"
    if [ -f "$amdfile"]; then
        sudo pacman -S --needed --noconfirm - < "$amdfile"
    else
        echo "amd package file not found: $amdfile"
    fi
}

install-aur-packages() {
    aurfile="$HOME/import/packages/aur"
    if [ -f "$aurfile" ]; then
        yay -S --needed -noconfirm - < "$aurfile"
    else
        echo "aur package file not found: $aurfile"
    fi 
}

install-yay() {
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
}
