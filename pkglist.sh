#packagelist
declare -A aur
declare -A pac
declare -A flat
aur["amd_drivers"]="
mesa-git
lib32-mesa-git
"

pac["audio_drivers"]="
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
"


pac["fonts"]="
noto-fonts-emoji
noto-fonts
noto-fonts-emoji
noto-fonts-extra
ttf-sourcecodepro
"

aur["fonts_aur"]="
ttf-monaco
adobe-source-has-fonts
ttf-font-awesome
"
aur["aurpkg"]="
wttrbar-git
wttr
dotnet-runtime-bin
browsh
mangohud
lib32-mangohud
goverlay
vkbassalt
hyperpicker-git
xdg-desktop-portal-termfilechooser-git
input-remapper-git
#polkit-dumb-agent-git
lxqt-policykit
easyrpg-player
grapejuice-git
showmethekeys
flameshot-git
visual-studio-code-bin
protonup-qt
bottles
looking-glass
gcalcli
godot-git
yewtube-git
grapejuice-git
tidal-hifi-bin
mpvpaper
swaync
lib32-gperftools
bluez-git
vrrtest-git
cli-visualizer
autojump
"

pac["virtualization"]="
qemu-full
libvirt
edk2-ovmf
virt-manager
virt-viewer
swtpm
iptables-nft
dnsmasq
"

