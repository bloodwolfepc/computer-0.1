#
# ~/.bashrc
#

export VISUAL=nvim
export RANGER_LOAD_DEFAULT_DIR="/home/bloodwolfe/Downloads"
#nk If not running interactively, don't do anything
[[ $- != *i* ]] && return
export XDG_CURRENT_DESKTOP=sway
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias nv='nvim'

alias frvol='pactl set-sink-volume "$(pactl list sinks | grep "Scarlett 4i4 USB Analog Surround 4.0" -B 3 | awk '\''/Name/ {print $NF}'\'')"'


nvconf() {
	nvim ~/.config/nvim/init.lua
}
#bash commands
bconf() {
	nvim ~/.bashrc
}

bref() {
	source ~/.bashrc
}

gconf() {
	sudo nvim /boot/grub/grub.cfg
}

#pipewire

pwconf() {
	sudo nvim /etc/pipewire
}
alsaconf() {
	nvim ~/.asoundrc
}
#sway commands
swayconf() {
	sudo nvim ~/.config/sway/config
}
sncconf() {
	nvim ~/.config/swaync/config.json
}
sncstyconf() {
	nvim ~/.config/swaync/style.css
}
sncref() {
	/usr/bin/swaync-client -R
}
sncstyref() {
	/usr/bin/swaync-client -rs
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
	nvim ~/.config/kitty/kitty.conf
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
khalconf() {
	nvim ~/.config/khal/config
}
vdirsyncconf() {
	sudo nvim ~/.config/vdirsyncer/config
}

#reminder of ~/.config/waybar/custom/tidal/albumart.sh

#fun stuff :3

albumbg() {
	swaybg -i /tmp/cover.jpeg
	sleep 2
	swaymsg reload
}
bgclear() {
	swaybg -c
	swaymsg reload
}

#houselights

off() {
	
	(echo '{"id":1,"method":"setState","params":{"state":false}}' | nc -u -w 1 192.168.0.153 38899) &
	(echo '{"id":1,"method":"setState","params":{"state":false}}' | nc -u -w 1 192.168.0.154 38899) &
	wait &
}



on() {
	(echo '{"id":1,"method":"setState","params":{"state":true}}' | nc -u -w 1 192.168.0.153 38899) &
	(echo '{"id":1,"method":"setState","params":{"state":true}}' | nc -u -w 1 192.168.0.154 38899) &
	wait &
}
pink() {
	(echo '{"id":1,"method":"setPilot","params":{"r":255,"g":80,"b":180,"dimming":100}}' | nc -u -w 1 192.168.0.153 38899) &
	(echo '{"id":1,"method":"setPilot","params":{"r":255,"g":80,"b":180,"dimming":100}}' | nc -u -w 1 192.168.0.154 38899) &
	wait &
}
purple() {
	(echo '{"id":1,"method":"setPilot","params":{"r":123,"g":62,"b":170,"dimming":100}}' | nc -u -w 1 192.168.0.153 38899) &
	(echo '{"id":1,"method":"setPilot","params":{"r":123,"g":62,"b":170,"dimming":100}}' | nc -u -w 1 192.168.0.154 38899) &
	wait &
}
blue() {
	(echo '{"id":1,"method":"setPilot","params":{"r":0,"g":0,"b":255,"dimming":100}}' | nc -u -w 1 192.168.0.153 38899) &
	(echo '{"id":1,"method":"setPilot","params":{"r":0,"g":0,"b":255,"dimming":100}}' | nc -u -w 1 192.168.0.154 38899) &
	wait &
}
red() {
	(echo '{"id":1,"method":"setPilot","params":{"r":255,"g":0,"b":0,"dimming":100}}' | nc -u -w 1 192.168.0.153 38899) &
	(echo '{"id":1,"method":"setPilot","params":{"r":255,"g":0,"b":0,"dimming":100}}' | nc -u -w 1 192.168.0.154 38899) &
	wait &
}
expred() {
	(echo '{"id":1,"method":"setPilot","params":{"r":255,"g":0,"b":0,"dimming":30}}' | nc -u -w 1 192.168.0.153 38899) &
	(echo '{"id":1,"method":"setPilot","params":{"r":255,"g":0,"b":0,"dimming":30}}' | nc -u -w 1 192.168.0.154 38899) &
	wait &
}
green() {
	(echo '{"id":1,"method":"setPilot","params":{"r":0,"g":255,"b":0,"dimming":100}}' | nc -u -w 1 192.168.0.153 38899) &
	(echo '{"id":1,"method":"setPilot","params":{"r":0,"g":255,"b":0,"dimming":100}}' | nc -u -w 1 192.168.0.154 38899) &
	wait &
}


coldwhite() {
	(echo '{"id":1,"method":"setPilot","params":{"c":200,"dimming":100}}' | nc -u -w 1 192.168.0.153 38899) &
	(echo '{"id":1,"method":"setPilot","params":{"c":200,"dimming":100}}' | nc -u -w 1 192.168.0.154 38899) &
	wait &
}

25white() {
	(echo '{"id":1,"method":"setPilot","params":{"c":64,"w":64,"dimming":90}}' | nc -u -w 1 192.168.0.153 38899) &
	(echo '{"id":1,"method":"setPilot","params":{"c":64,"w":64,"dimming":90}}' | nc -u -w 1 192.168.0.154 38899) &
	wait &
}
warmwhite() {
	(echo '{"id":1,"method":"setPilot","params":{"c":40,"w":160,"dimming":80}}' | nc -u -w 1 192.168.0.153 38899) &
	(echo '{"id":1,"method":"setPilot","params":{"c":40,"w":160,"dimming":80}}' | nc -u -w 1 192.168.0.154 38899) &
	wait &
}


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



neofetch
