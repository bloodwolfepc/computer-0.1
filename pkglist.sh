#packagelist#

#would prefer the use keys which would indicate the package type for each array and have arrays listed in those keys, but this seems should be fine


pacpkg=(
#PC UTILS
gnu-netcat
gamemode
git
wine
wine-staging
gtk4
qt5-webengine
vulkan-tools
flatpak
flatpak-builder
unison
cups
exfat-utils
pass
android-file-transfer
hid-tools
lib32-libcanberra
v4l2loopback
v4l2loopback-utils
xdg-desktop-portal
xdg-desktop-portal-wlr
p7zip
icpi #network piping
#freerdp #how in the world does this even work?
npm #for nodejs, idk if this needs to be listed
ctags
cmake
clang
nodejs

#DISPLAY MANAGER UTILS
sway
xorg-xwayland
xorg-xwininfo
weston
rofi
waybar
waynvc
wl-mirror
swayimg
cliphist
grim
slurp
flameshot
swaybg
swayimg
ydotool
gamescope


#TERMINAL
zsh
zsh-completions
ranger
ffmpegthumbnailer
neovim
neovim
kitty
fzf
tree
htop
btop

#BROWSERS
firefox

#MISC
gimp
krita
steam
mpv
ffmpeg
zathura
zathura-pdf-poppler
#discord #using screenaudio instead
#obs-studio #using git version
)



nvidia_dri=(
neauveau-git
#its not really all that good *yet*
)

amd_dri=(
mesa-git
lib32-mesa-git
)

audio_dri=(
pipewire
lib32-pipewire
pipewire-docs
wireplumber
qpwgraph
pipewire-alsa
pipewire-jack
pipewire-zeroconf
lib32-alsa-lib
lib32-alsa-plugins
alsa-utils
lib32-pipewire-jack
)


fonts=(
noto-fonts-emoji
noto-fonts
noto-fonts-emoji
noto-fonts-extra
ttf-sourcecodepro
)

fonts_aur=(
ttf-monaco
adobe-source-has-fonts
ttf-font-awesome
)

aurpkg=(
#PC UTILS
dotnet-runtime-bin
xdg-desktop-portal-termfilechooser-git
input-remapper-git
lxqt-policykit
bluez-git

#DISPLAY MANAGER UTILS
wttrbar-git
hyperpicker-git #still need to bind this
mpvpaper
swaync


#TERMINAL
wttr
autojump
cli-visualizer

#MISC
mangohud
lib32-mangohud
goverlay
vkbassalt
easyrpg-player
#showmethekeys
#visual-studio-code-bin
protonup-qt
godot-git
#grapejuice-git #hopefully they finally fix this on wayland #trying flatpak
vrrtest-git
ryujinx-bin
lib32-gperftools
)

pro_audio=(
pro-audio 
#sometimes has disceprencies, prefer to manage on its own
)

#flat=(
#bottles
#de.shorsh.discord-screenaudio
#grapejuice
#)

virtualization=(
qemu-full
libvirt
edk2-ovmf
virt-manager
virt-viewer
swtpm
iptables-nft
dnsmasq
)

virtulatization_aur=(
looking-glass
)

xorg=(
xfxe4
xfce4-goodies
xorg
)






