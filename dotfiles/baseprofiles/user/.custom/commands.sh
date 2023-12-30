alias nv='nvim'
alias snv='sudo nvim'
alias sr'sudo ranger'
alias frvol='pactl set-sink-volume "$(pactl list sinks | grep "Scarlett 4i4 USB Analog Surround 4.0" -B 3 | awk '\''/Name/ {print $NF}'\'')"'
alias mod1="sudo chmod -R u+rwX"
alias mod2="sudo chown -R $USER:$USER"
brightness="/sys/class/backlight/amdgpu_bl2/brightness"

#ip
#sshhost_file="$HOME/.hostip"


#sshhost=$(cat "$sshhost_file")
#lbip1=$(cat "$HOME/.ip/lbip1")
#lbip2=$(cat "$HOME/.ip/lbip2")

xdgconf() {
	nv ~/.config/xdg-desktop-portal/portals.conf
}
westonconf() {
	sudo nvim ~/.config/weston.ini
}
fstabconf() {
	sudo nvim /etc/fstab
}

gsdtlo() {
	wl-copy "gamemoderun mangohud gamescope -e -f -W 1920 -H 1080 -r 144 %command%"
	echo "gsdtlo on clipboard"
}

ssdtlo() {
	wl-copy "gamemoderun mangohud gamescope -e -f -w 3820 -h 2160 -W 1920 -H 1080 -r 144 %command%"
	echo "ssdtlo on clipboard"
}


vcam() {
	sudo rmmod v4l2loopback
	sudo modprobe v4l2loopback video_nr=9 card_label=Video-Loopback exclusive_caps=1
}
sense() {
 swaymsg input 9610:54:Glorious_Model_O pointer_accel $1
}

customconf() {
	r $HOME/.custom
}
#disc() {
#	discord-screenaudio/build/discord-screenaudio
#}

quteconf() {
	r ~/.config/qutebrowser
}

setbr() {
	mod1 $brightness
	mod2 $brightness
	echo $1 > $brightness
}

comconf() {
      nv $HOME/.custom/commands.sh
   }


qssh() {
	ssh $hostip
}
udd() {
	update-desktop-database ~/.local/share/applications/
}
size() {
	du -sh .
}

update() {
	sudo -v
	sudo pacman -Syu --needed --noconfirm
	flatpack update
	yay -Syu --needed --noconfirm
	sudo -k
}

mplay() {
	playerctl play
}
mpause() {
	playerctl pause
}
mnext() {
	playerctl next
}
mprev() {
	playerctl previous
}
wpconf() {
	r ~/.config/wireplumber
}
wpref() {
systemctl --user restart wireplumber pipewire pipewire-pulse
}

syncconf() {
	 nv ~/.unison/default.prf
 }

nvconf() {
	nv ~/.config/nvim/init.lua
}
#bash commands
zconf() {
	nv ~/.zshrc
}

mpvconf() {
	nv ~/.config/mpv/mpv.conf
}

zref() {
	source ~/.zshrc
}

grubconf() {
	sudo nvim /boot/grub/grub.cfg
}

#pipewire

pwconf() {
	r /.config/pipewire
}
alsaconf() {
	nv ~/.asoundrc
}
#sway commands
swayconf() {
	nv ~/.config/sway/config
}
monitorconf() {
	nv ~/.config/sway/monitor-config
}
swaystyconf() {
	nv ~/.config/sway/style-config
}

sncconf() {
	nv ~/.config/swaync/config.json
}
sncstyconf() {
	nv ~/.config/swaync/style.css
}
wbconf() {
	nv ~/.config/waybar/config
}
wbstyconf() {
	nv ~/.config/waybar/style.css
}
swayref() {
	swaymsg reload
}

swayconfgen() {
	sudo cp /etc/sway/config ~/.config/sway/config
}

kittyconf() {
	nv ~/.config/kitty/kitty.conf
}

gtk3conf() {
	nv ~/.config/gtk-3.0/settings.ini
}

gtk2conf() {
	nv ~/.gtkrc-2.0
}

evcode() {
	nv /usr/include/linux/input-event-codes.h
}


#ranger configs

rconf() {
	nvim ~/.config/ranger/rc.conf
}
rrconf() {
	nvim ~/.config/ranger/rifle.conf
}
rsconf() {
	nvim ~/.config/ranger/scope.sh
}
rcomconf() {
	nvim ~/.config/ranger/commands.py
}
rcomfullconf() {
	nvim ~/.config/ranger/commands_full.py
}




roficonf() {
	nvim ~/.config/rofi/config.rasi
}

nfconf() {
	nvim ~/.config/neofetch/config.conf
}
nf2conf() {
	sudo nvim /usr/bin/neofetch
}

sinks() {
	pactl list sinks | awk '/Sink #|Name:/'
}
setsink() {
	pactl set-default-sink $1
}
speakertest() {
	speaker-test -c 2 -t wav -l 1
}
sync() {
	unison default
}

#laptop powersave



setcoresoff() {
sudo -v
mod1 /sys/devices/system/cpu/*
mod2 /sys/devices/system/cpu/*
for x in /sys/devices/system/cpu/cpu{4..$1}*/online; do
  echo 0 > "$x"
  echo "power off core $x"
done
sudo -k
}
setcoreson() {
sudo -v
mod1 /sys/devices/system/cpu/*
mod2 /sys/devices/system/cpu/*
for x in /sys/devices/system/cpu/cpu{4..$1}*/online; do
  echo 1 > "$x"
  echo "power restored core $x"
done
sudo -k
}
ltpowersave() {
setcoresoff 15
#change this to register a default value if there is no input
swaymsg output eDP-2 resolution 2560x1600@60Hz
sleep 1
swaymsg reload
sleep 1
sudo cpupower frequency-set -g powersave
setbr 125
}



ltpowerhigh() {
setcoreson 15
swaymsg output eDP-2 resolution 2560x1600@120Hz
echo "120Hz enabled"
sleep 1
swaymsg reload
sleep 1
sudo cpupower frequency-set -g performance
setbr 255
}

syncconf() {
	 nv ~/.unison/default.prf
 }



#reminder of ~/.config/waybar/custom/tidal/albumart.sh

#fun stuff :3

albumbg() {
	swaybg -i /tmp/cover.jpeg	
}
bgclear() {
	swaybg -c
	swaymsg reload
}


#LIGHTING
off() {
	
	(echo '{"id":1,"method":"setState","params":{"state":false}}' | nc -u -w 1 192.168.0.153 38899) &
	(echo '{"id":1,"method":"setState","params":{"state":false}}' | nc -u -w 1 192.168.0.154 38899)
}

on() {
	(echo '{"id":1,"method":"setState","params":{"state":true}}' | nc -u -w 1 $lbip1 38899) &
	(echo '{"id":1,"method":"setState","params":{"state":true}}' | nc -u -w 1 $lbip2 38899)
}
#change this to a for loop
cwlight() {
	(echo '{"id":1,"method":"setPilot","params":{"c":'$1',"w":'$2',"dimming":'$3'}}' | nc -u -w 1 $lbip1 38899) &
	(echo '{"id":1,"method":"setPilot","params":{"c":'$1',"w":'$2',"dimming":'$3'}}' | nc -u -w 1 $lbip2 38899)
}

rgblight() {
	(echo '{"id":1,"method":"setPilot","params":{"r":'$1',"g":'$2',"b":'$3',"dimming":'$4'}}' | nc -u -w 1 $lbip1 38899) &
	(echo '{"id":1,"method":"setPilot","params":{"r":'$1',"g":'$2',"b":'$3',"dimming":'$4'}}' | nc -u -w 1 $lbip2 38899)
}

warmwhite() {cwlight 40 140 80}
25whtie() {cwlight 64 64 90}
coldwhtie() {cwlight 200 0 100}
red() {rgblight 255 0 0 100}
green() {rgblight 0 255 0 100}
blue() {rgblight 0 0 255 100}
purple() {rgblight 123 62 170 100}
pink() {rgblight 255 80 180 100}
dim() {cwlight 40 120 20}
alarm() {

	local num_repeats=$1
	local interval=$2

	for ((i = 0; i < num_repeats; i++)); do
	    off
	    sleep $interval
	   on
	    sleep $interval
	done
}


