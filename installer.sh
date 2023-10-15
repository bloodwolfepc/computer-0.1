host="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $host/packages.sh
source $host/migratedotfiles.sh
sudo -v



install-audio-dri
install-msi-dri
install-pacman-packages
install-yay
install-aur-packages
install-emulator-packages
install-emulator-aur-packages
install-fonts
install-fonts-aur
install-virtualization-packages
install-discord-screenaudio

migrate-dot-files
allocate-assets
enable-services
laptop-specifics

sudo -k

echo "configure monitor before launching sway 'monitorconf'"
source $HOME/.bashrc
source /bin/custom/cloud.sh
neofetch
