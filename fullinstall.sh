host="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $host/packages.sh
source $host/migratedotfiles.sh
sudo -v



install-audio-dri
#install-msi-dir
install-pacman-packages
install-yay
install-aur-packages
#install-emulator-packages
#install-emulators-aur-packages
install-fonts
install-fonts-aur
#install-virtualization-packages

migrate-dot-files


sudo -k
