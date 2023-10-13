host="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


install-pacman-packages() {
    pacfile="$host/packages/pacman"
    if [ -f "$pacfile" ]; then
        # Use a while loop to read packages line by line
        while IFS= read -r package; do
            # Check if the package is not empty
            if [ -n "$package" ]; then
                # Try to install the package, and if it fails, log an error but continue with the next package
                sudo pacman -S --needed --noconfirm "$package" || echo "Error installing package: $package"
            fi
        done < "$pacfile"
    else
        echo "pac package file not found: $pacfile"
    fi
}

install-amd-dri() {
    pacfile="$host/packages/amd-drivers"
    cat $pacfile
    if [ -f "$pacfile" ]; then
        sudo pacman -S --needed --noconfirm - < "$pacfile"
    else
        echo "amd package file not found: $pacfile"
    fi
}

install-audio-dri() {
    sudo pacman -R pipewire-media-session --noconfirm
    sudo pacman -R puleausio --noconfirm
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
        yay -S --needed --noconfirm - < "$pacfile"
    else
      echo "aur package file not found: $pacfile"
    fi
}

install-aur-packages() {
    pacfile="$host/packages/aur"
    cat $pacfile
    if [ -f "$pacfile" ]; then
        yay -S --needed --noconfirm - < "$pacfile"
    else
        echo "aur package file not found: $pacfile"
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
        yay -S --needed --noconfirm - < "$pacfile"
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

install-discord-screenaudio() {
    cd $HOME
    git clone https://github.com/maltejur/discord-screenaudio.git
    cd discord-screenaudio
    cmake -B build
    cmake --build build --config Release
    cd ..
}

install-yay() {
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
}



