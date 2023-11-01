alias nv='nvim'
alias snv='sudo nvim'
alias sr'sudo ranger'
alias frvol='pactl set-sink-volume "$(pactl list sinks | grep "Scarlett 4i4 USB Analog Surround 4.0" -B 3 | awk '\''/Name/ {print $NF}'\'')"'
alias mod1="sudo chmod -R u+rwX"
alias mod2="sudo chown -R $USER:$USER"
brightness="/sys/class/backlight/amdgpu_bl2/brightness"
sshhost_file="$HOME/.hostip"
sshhost=$(cat "$sshhost_file")

disc() {
	discord-screenaudio/build/discord-screenaudio
}

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
	sshhost_file="$HOME/.hostip"
	sshhost=$(cat "$sshhost_file")
	ssh $sshhost
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
khalconf() {
	nvim ~/.config/khal/config
}
vdirsyncconf() {
	nv ~/.config/vdirsyncer/config
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
sync() {
	unison default
}


ltpowersave() {

sudo -v
for i in $(seq 4 $(nproc)); do
  sudo bash -c "echo 0 > /sys/devices/system/cpu/cpu$i/online"
done
echo "cpu cores limited to 4"
swaymsg output eDP-2 resolution 2560x1600@60Hz
sleep 1
swaymsg reload
sleep 1
sudo cpupower frequency-set -g powersave
setbr 40
sudo -k
}

ltpowerhigh() {
sudo -v
mod1 /sys/devices/system/cpu/*
mod2 /sys/devices/system/cpu/*

for x in /sys/devices/system/cpu/cpu{4..15}*/online; do
  echo 1 > "$x"
  echo "power restored core $x"
done

swaymsg output eDP-2 resolution 2560x1600@120Hz
echo "120Hz enabled"
sleep 1
swaymsg reload
sleep 1
sudo cpupower frequency-set -g performance
setbr 255
sudo -k
}

syncconf() {
	 nv ~/.unison/default.prf
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
dim() {
	(echo '{"id":1,"method":"setPilot","params":{"c":40,"w":120,"dimming":20}}' | nc -u -w 1 192.168.0.153 38899) &
	(echo '{"id":1,"method":"setPilot","params":{"c":40,"w":120,"dimming":20}}' | nc -u -w 1 192.168.0.154 38899) &
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


