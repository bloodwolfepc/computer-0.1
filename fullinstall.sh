host="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
sudo -v

source $host/packages.sh

install-pacman-packages
#install-msi-dri
install-yay

sudo -k
