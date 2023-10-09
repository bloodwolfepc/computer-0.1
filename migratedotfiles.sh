host="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
dotfiles="$host/dotfiles"
sudo -v

migrate-dot-files() {
    mkdir -p $HOME/.config/nvim
    cp $dotfiles/nvim/init.lua $HOME/.config/nvim/init.lua
    #cp -r $dotfiles/etc/pipewire /etc/pipewire
    mkdir -p $HOME/.config/sway
    cp $dotfiles/sway/* $HOME/.config/sway/*
    mkdir -p $HOME/.config/swaync
    cp $dotfiles/swaync/config.json $HOME/.config/swaync/config.json
    cp $dotfiles/swaync/style.css $HOME/.config/swaync/style.css
    mkdir -p $HOME/.config/waybar
    cp $dotfiles/waybar/config $HOME/.config/waybar/config
    cp $dotfiles/waybar/style.css $HOME/.config/waybar/style.css
    mkdir -p $HOME/.config/kitty
    cp $dotfiles/kitty/kitty.conf $HOME/.config/kitty/kitty.conf
    mkdir -p $HOME/.config/ranger
    cp -r $dotfiles/ranger/* $HOME/.config/ranger/
    mkdir -p $HOME/.config/rofi
    cp $dotfiles/rofi/config.rasi $HOME/.config/rofi/config.rasi
    mkdir -p $HOME/.config/neofetch
    cp $dotfiles/neofetch/config.conf $HOME/.config/neofetch/config.conf
    cp $dotfiles/gtk2/.gtk2rc-2.0 $HOME/.gtk2rc-2.0
    sudo cp $dotfiles/bin/neofetch /usr/bin/neofetch
    sudo mkdir -p /bin/custom
    sudo cp -r $dotfiles/custom/* /bin/custom/
    sudo cp $dotfiles/bashrc/.bashrc $HOME/.bashrc

    echo "dotfiles migrated"
}

allocate-assets() {
mkdir -p -$HOME/.wallpapers
cp -r $host/assets/wallpapers/* $HOME/.wallpapers/

#mkdir -p $HOME/.icons
cp -r $host/assets/cursors/* /usr/share/icons/
    echo "assets allocated"
}

sudo -k

enable-services() {
sudo systemctl start sshd.service
sudo systemctl enable sshd.service
#remember ssh commands ssh-keygen and ssh-copy-id
    "services enabled"
}
