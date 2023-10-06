host="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


install-pacman-packages() {
    pacfile="$host/packages/pacman"
    if [ -f "$pacfile" ]; then
        sudo pacman -S --needed --noconfirm - < "$pacfile"
    else
      echo "pac package file not found: $pacfile"
    fi
}

install-amd-dri() {
    amdfile="$host/packages/amd-drivers"
    if [ -f "$amdfile"]; then
        sudo pacman -S --needed --noconfirm - < "$amdfile"
    else
        echo "amd package file not found: $amdfile"
    fi
}

install-audio-dri() {
    pacfile="$host/packages/audio-drivers"
    if [ -f "$pacfile" ]; then
        sudo pacman -S --needed --noconfirm - < "$pacfile"
    else
      echo "pac package file not found: $pacfile"
    fi
}

install-emulator-packages() {
    pacfile="$host/packages/emulators"
    if [ -f "$pacfile" ]; then
        sudo pacman -S --needed --noconfirm - < "$pacfile"
    else
      echo "pac package file not found: $pacfile"
    fi
}

install-emulator-aur-packages() {
    pacfile="$host/packages/emulators-aur"
    if [ -f "$pacfile" ]; then
        sudo pacman -S --needed --noconfirm - < "$pacfile"
    else
      echo "aur package file not found: $pacfile"
    fi
}

install-aur-packages() {
    aurfile="$host/packages/aur"
    if [ -f "$aurfile" ]; then
        yay -S --needed -noconfirm - < "$aurfile"
    else
        echo "aur package file not found: $aurfile"
    fi 
}

install-fonts() {
    pacfile="$host/packages/fonts"
    if [ -f "$pacfile" ]; then
        sudo pacman -S --needed --noconfirm - < "$pacfile"
    else
      echo "pac package file not found: $pacfile"
    fi
}

install-fonts-aur() {
    pacfile="$host/packages/fonts-aur"
    if [ -f "$pacfile" ]; then
        sudo pacman -S --needed --noconfirm - < "$pacfile"
    else
      echo "aur package file not found: $pacfile"
    fi
}

install-virtualization-packages() {
    pacfile="$host/packages/virtualization"
    if [ -f "$pacfile" ]; then
        sudo pacman -S --needed --noconfirm - < "$pacfile"
    else
      echo "pac package file not found: $pacfile"
    fi
}

install-yay() {
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
}
