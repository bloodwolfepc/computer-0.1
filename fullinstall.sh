host="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
sudo -v

source $host/packages.sh
source $host/migratedotfiles.sh

sudo pacman -R pipewire-media-session --noconfirm

#install-msi-dir
install-pacman-packages
install-yay
install-audio-dri
install-aur-packages
#install-emulator-packages
#install-emulators-aur-packages
install-fonts
install-fonts-aur
#install-virtualization-packages

migrate-dot-files


sudo -k
